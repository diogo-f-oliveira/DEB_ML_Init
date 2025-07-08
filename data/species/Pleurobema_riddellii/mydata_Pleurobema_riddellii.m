function [data, auxData, metaData, txtData, weights] = mydata_Pleurobema_riddellii
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Pleurobema_riddellii'; 
metaData.species_en = 'Louisiana pigtoe'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};
metaData.data_1     = {'t-L'}; 

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
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 20*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'FordPlan2020';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement'; bibkey.Lj  = 'guess';  
data.Lp  = 3.76;  units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 6.8;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'FordPlan2020';

data.Wwi = 14.4; units.Wwi = 'g';   label.Wwi = 'total wet weight at shell length 5.1 cm';   bibkey.Wwi = 'FordPlan2020';

data.Ri = 18413/365;    units.Ri = '#/d';    label.Ri = 'reproduction rate at SL 4.31 cm'; bibkey.Ri = 'Haag2013';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'Based on Pleurobema_strodeanum';

% uni-variate data
  
% time-length
data.tL = [ ... %time since settlement (yr), shell length (cm)
4.977	2.669
7.064	4.116
7.962	4.144
7.963	4.355
9.003	4.467
9.004	4.649
9.947	4.480
9.950	4.846
9.951	5.029
9.997	4.762
10.039	4.031
10.937	4.213
10.945	5.408
10.991	5.225
10.992	5.323
11.038	5.056
11.083	4.803
11.938	5.548
11.939	5.745
11.993	6.616
12.974	5.070
12.975	5.168
12.976	5.435
12.978	5.646
14.020	6.152
14.065	5.730
14.866	5.477
14.961	5.645
14.962	5.730
14.962	5.828
15.002	4.647
15.957	6.249
16.897	5.631
17.040	5.841
20.018	6.220];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to cm after 7 yrsd
units.tL = {'d', 'cm'}; label.tL = {'time since settlement', 'shell length'};  
temp.tL = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FordPlan2020';
comment.tL = 'mean temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
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
metaData.links.id_CoL = '6VRRT'; % Cat of Life
metaData.links.id_ITIS = '80128'; % ITIS
metaData.links.id_EoL = '449422'; % Ency of Life
metaData.links.id_Wiki = 'Pleurobema_riddellii'; % Wikipedia
metaData.links.id_ADW = 'Pleurobema_riddellii'; % ADW
metaData.links.id_Taxo = '535315'; % Taxonomicon
metaData.links.id_WoRMS = '857369'; % WoRMS
metaData.links.id_molluscabase = '857369'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pleurobema_riddellii}}';
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
bibkey = 'FordPlan2020'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10750-020-04228-8}, ' ...
'author = {David F. Ford and Edith D. Plants-Paris and Neil B. Ford}, ' ... 
'year = {2020}, ' ...
'title = {Comparison of Louisiana Pigtoe (\emph{Pleurobema riddellii}, {M}ollusca, {U}nionidae) growth at three different locations in the {N}eches {R}iver {B}asin of {E}ast {T}exas}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {847}, ' ...
'pages = {2021-2033}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haag2013'; type = 'Article'; bib = [ ...
'doi = {10.1111/brv.12028}, ' ...
'author = {Wendell R. Haag }, ' ... 
'year = {2013}, ' ...
'title = {The role of fecundity and reproductive effort in defining life-history strategies of {N}orth {A}merican freshwater mussels}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {88}, ' ...
'pages = {745-766}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

