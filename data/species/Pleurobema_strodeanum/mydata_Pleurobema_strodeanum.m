function [data, auxData, metaData, txtData, weights] = mydata_Pleurobema_strodeanum
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Pleurobema_strodeanum'; 
metaData.species_en = 'Fuzzy pigtoe'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'};
metaData.data_1     = {'L0-Lt'; 'Ww0-Wwt'; 'L-N'}; 

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 10];      

%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'unio';   
  temp.ab = C2K(14);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 75*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'ReatStew2013';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement'; bibkey.Lj  = 'guess';  
data.Lp  = 3.76;  units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'ReatStew2013'; 
data.Li  = 7.2;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'ReatStew2013';

data.Wwi = 14.4; units.Wwi = 'g';   label.Wwi = 'total wet weight at shell length 5.1 cm';   bibkey.Wwi = 'ReatStew2013';

% uni-variate data
  
% initial length- length after 7 yr
data.LL = [ ... % shell length (cm), growth rate (percentage after 7yr)
3.758	11.271
3.977	6.652
4.014	9.777
4.037	10.660
4.089	7.816
4.100	9.774
4.120	8.762
4.122	8.383
4.170	6.076
4.240	7.684
4.277	14.061
4.300	6.450
4.301	8.566
4.351	7.585
4.374	7.931
4.375	3.194
4.383	10.836
4.406	9.762
4.418	7.172
4.436	5.434
4.437	7.771
4.468	5.717
4.618	7.922
4.638	5.710
4.672	5.425
4.966	8.003
5.164	2.753];
data.LL(:,2) = data.LL(:,1) .* (1 + data.LL(:,2)/100); % convert %/7yr to cm after 7 yrs
units.LL = {'cm', 'cm'}; label.LL = {'shell length', 'shell length after 7 yr'};  
temp.LL = C2K(9);  units.temp.LL = 'K'; label.temp.LL = 'temperature';
bibkey.LL = 'ReatStew2013';
comment.LL = 'mean temperature is guessed';

% weight, weight after 7 yr
data.WW = [ ... % shell volume (mm^3), growth rate (percentage after 7yr)
5.535	41.548
5.868	49.290
6.166	30.581
6.166	33.806
6.726	28.258
6.742	36.129
7.015	31.742
7.190	41.419
7.262	40.903
7.348	40.000
7.430	24.645
7.519	34.968
7.719	29.548
8.096	41.161
8.239	34.968
8.343	48.387
8.510	25.161
8.595	22.194
8.670	34.839
8.869	25.677
9.360	30.323
9.458	21.935
9.548	36.903
10.364	19.484
10.737	13.806
11.430	24.645
14.419	9.032];
%data.WW(:,1) = data.WW(:,1)/ 1e3; % convert mm^3 to g
data.WW(:,2) = data.WW(:,1) .* (1 + data.WW(:,2)/100); % convert %/yr to g after 7 yr
units.WW = {'g', 'g'}; label.WW = {'total wet weight', 'total wet weight after 7 yr'};  
temp.WW = C2K(9);  units.temp.WW = 'K'; label.temp.WW = 'temperature';
bibkey.WW = 'ReatStew2013';
comment.WW = 'ReatStew2013 give volumes in mm^3, but the assumption is that this should be cm^3; mean temperature is guessed';

% length - fecundity
data.LN = [ % shell length (cm), fecundity (#)
    4.671 20800
    3.765 11920
    4.105   860
    4.280 17680
    4.564 39733
    4.616   330
    4.002 15200
    4.304 15200
    4.852 18960
    4.283 14100
    4.044 17000];
units.LN = {'cm', '#'}; label.LN = {'shell length', 'fecundity'};  
temp.LN = C2K(14);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'PilaStew2005';
comment.LN = 'mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.LL = 10 * weights.LL;
weights.WW = 10 * weights.WW;
weights.Li = 10 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
%weights.psd.p_M = 0;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6VRS8'; % Cat of Life
metaData.links.id_ITIS = '80113'; % ITIS
metaData.links.id_EoL = '449407'; % Ency of Life
metaData.links.id_Wiki = 'Pleurobema_strodeanum'; % Wikipedia
metaData.links.id_ADW = 'Pleurobema_strodeanum'; % ADW
metaData.links.id_Taxo = '535322'; % Taxonomicon
metaData.links.id_WoRMS = '857373'; % WoRMS
metaData.links.id_molluscabase = '857373'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pleurobema_strodeanum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReatStew2013'; type = 'Article'; bib = [ ...
'author = {Evelyn G. Re\''{a}tegui-Zirena and Paul M. Stewart and Jonathan M. Miller}, ' ... 
'year = {2013}, ' ...
'title = {Growth Rates and Age Estimations of the Fuzzy Pigtoe, \emph{Pleurobema strodeanum}: {A} Species Newly Listed under the Endangered Species Act}, ' ...
'journal = {Southeastern Naturalist}, ' ...
'volume = {12(1)}, ' ...
'pages = {161-170}, ' ...
'howpublished = {\url{http://scholarworks.uark.edu/jaas/vol54/iss1/9}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PilaStew2005'; type = 'techreport'; bib = [ ...
'author = {Megan M. Pilarczyk and Paul M. Stewart and Douglas N. Shelton and William H. Heath and Jonathan M. Miller}, ' ... 
'year = {2005}, ' ...
'title = {Contemporary survey and historical freshwater mussel assemblages in southeast {A}labama and northwest {F}lorida and life history and host fish identification of two candidate unionids (\emph{Quincuncina burkei} and \emph{Pleurobema strodeanum})}, ' ...
'institution = {Troy University and Alabama Malacological Research Centre}, ' ...
'howpublished = {\url{https://www.researchgate.net/publication/280308822_Contemporary_survey_and_historical_freshwater_mussel_assemblages_in_southeast_Alabama_and_northwest_Florida_and_life_history_and_host_fish_identification_of_two_candidate_unionids_Quincuncina_burkei_a/link/588647cb92851c21ff4d5935/download}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

