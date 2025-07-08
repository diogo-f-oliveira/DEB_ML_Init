function [data, auxData, metaData, txtData, weights] = mydata_Nematoflustra_flagellata

%% set metaData
metaData.phylum     = 'Bryozoa'; 
metaData.class      = 'Gymnolaemata'; 
metaData.order      = 'Cheilostomatida'; 
metaData.family     = 'Flustridae';
metaData.species    = 'Nematoflustra_flagellata'; 
metaData.species_en = 'Antarctic bryozoan'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'Ob'};

metaData.T_typical  = C2K(0); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'}; 
metaData.data_1     = {'Wd-Wd'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 26]; 

%% set data
% zero-variate data

data.am = 26*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Bars1995';   
  temp.am = C2K(0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wdi  = 12.5;   units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'Bars1995';
  comment.Wdi = 'based on lack of de-acelleration of growth; max weight probably controlled by wear and age';
 
% uni-variate data
% weight-weight
data.WdWd = [... % dry weight (g), dry weight after 1 yr (g)
1.129	1.090
1.173	1.039
1.225	1.314
3.103	2.272
4.483	3.468
4.540	3.717
4.599	4.157
5.204	4.029
5.918	4.606
5.964	4.936
6.311	4.964
6.393	4.808
6.697	4.658
7.141	5.736
7.441	5.892
7.855	5.213
8.684	5.896
9.380	6.811
9.979	6.528
10.081	7.148];
units.WdWd   = {'g', 'g'};  label.WdWd = {'dry weight', 'dry weight increment after 1 yr'};  
temp.WdWd    = C2K(0);  units.temp.WdWd = 'K'; label.temp.WdWd = 'temperature';
bibkey.WdWd = 'Bars1995';

%% set weights for all real data
weights = setweights(data, []);
weights.WdWd = 5 * weights.WdWd;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;


%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Since no data on sexual reproduction could be found, kappa is fixed at 0.95';
D2 = 'The abj model was applied because V1-morphy is implied by F1, with E_Hp set at E_Hj';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'data refer to colonies, which grow in single leaves of constant thickness.';
metaData.bibkey.F1 = 'Bars1995'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6S7CR'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '2974942'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3921737'; % Taxonomicon
metaData.links.id_WoRMS = '173787'; % WoRMS

%% References
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
bibkey = 'Bars1995'; type = 'Article'; bib = [ ... 
'author = {David K. A. Barnes}, ' ... 
'year = {1995}, ' ...
'title = {Seasonal and annual growth in erects species of {A}ntarctic bryozoans}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {188}, ' ...
'pages = {181-198}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
