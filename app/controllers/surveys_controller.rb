class SurveysController < ApplicationController
  # GET /surveys
  # GET /surveys.xml
  def index
    @surveys = Survey.all(:order => 'created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @surveys }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.xml
  def show
    @survey = Survey.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @survey.to_xml (
        :only => [
          :updated_at
        ],
        :include => {
          :questions => {
            :only => [
              :content
            ],
            :include => {
              :answers => {
                :only => [
                  :content,
                  :points,
                ],
                :methods => [ :url ]
              }
            }
          }
        }
        )
      }
      format.json  { render :json => @survey.to_json (
        :only => [
          :updated_at
        ],
        :include => {
          :questions => {
            :only => [
              :content
            ],
            :include => {
              :answers => {
                :only => [
                  :content,
                  :points,
                ],
                :methods => [ :url ]
              }
            }
          }
        }
        )
      }
    end
  end
  
  # hlasovanie
  def vote
    @answer = Answer.find(params[:answer_id])
    @answer.vote
  end

  # najnovsie hlasovanie
  def newest
    @survey = Survey.last

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @survey.to_xml (
        :only => [
          :updated_at
        ],
        :include => {
          :questions => {
            :only => [
              :content
            ],
            :include => {
              :answers => {
                :only => [
                  :content,
                  :points,
                ],
                :methods => [ :url ]
              }
            }
          }
        }
        )
      }
      format.json  { render :json => @survey.to_json (
        :only => [
          :updated_at
        ],
        :include => {
          :questions => {
            :only => [
              :content
            ],
            :include => {
              :answers => {
                :only => [
                  :content,
                  :points,
                ],
                :methods => [ :url ]
              }
            }
          }
        }
        )
      }
    end
  end

  # GET /surveys/new
  # GET /surveys/new.xml
  def new  
    @survey = Survey.new  
    1.times do  
      question = @survey.questions.build  
      4.times { question.answers.build }  
    end  
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
  end

  # POST /surveys
  # POST /surveys.xml
  def create
    @survey = Survey.new(params[:survey])

    respond_to do |format|
      if @survey.save
        format.html { redirect_to(@survey, :notice => 'Survey was successfully created.') }
        format.xml  { render :xml => @survey, :status => :created, :location => @survey }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.xml
  def update
    @survey = Survey.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        format.html { redirect_to(@survey, :notice => 'Survey was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.xml
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to(surveys_url) }
      format.xml  { head :ok }
    end
  end
end
