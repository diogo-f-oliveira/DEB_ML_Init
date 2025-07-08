function [data, auxData, metaData, txtData, weights] = mydata_Cellarinella_watersi
%% set metaData
metaData.phylum     = 'Bryozoa'; 
metaData.class      = 'Gymnolaemata'; 
metaData.order      = 'Cheilostomatida'; 
metaData.family     = 'Sclerodomidae';
metaData.species    = 'Cellarinella_watersi'; 
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
metaData.data_1     = {'t-Wd'}; 

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

data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'This guess does not have a firm basis.';
data.am = 26*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Bars1995';   
  temp.am = C2K(0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wdi  = 0.8;   units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'Bars1995';
  comment.Wdi = 'based on extrapolation of tWd data';
 
% uni-variate data
% weight-weight
data.tWd = [... % time (yr), number of zooids
0.995	38.401
2.013	112.684
2.998	261.886
4.061	458.730
5.009	591.386
6.021	725.669
7.034	1070.541];
data.tWd(:,1) = 365 * data.tWd(:,1); % convert yr to d
data.tWd(:,2) = 6e-4 * data.tWd(:,2); % convert # of zooids to colony dry weight using 6e-4 g dry weight per zooid
units.tWd   = {'g', 'g'};  label.tWd = {'dry weight', 'dry weight increment after 1 yr'};  
temp.tWd    = C2K(0);  units.temp.tWd = 'K'; label.temp.tWd = 'temperature';
bibkey.tWd = 'Bars1995';

%% set weights for all real data
weights = setweights(data, []);
weights.tWd = 5 * weights.tWd;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Since no data on sexual reproduction could be found, kappa is fixed at 0.95';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'data refer to colonies, which grow in leaves of constant thickness.';
metaData.bibkey.F1 = 'Bars1995'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'S3SB'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46586373'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3919627'; % Taxonomicon
metaData.links.id_WoRMS = '174331'; % WoRMS

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
