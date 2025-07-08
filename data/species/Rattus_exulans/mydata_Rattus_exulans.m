function [data, auxData, metaData, txtData, weights] = mydata_Rattus_exulans
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Rattus_exulans'; 
metaData.species_en = 'Polynesian rat'; 
metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi', 'TA'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCii', 'xiF'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(36.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 10 26];              

%% set data
% zero-variate data

data.tg = 20;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = C2K(36.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '19 to 21 d';
data.tx = 20;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'BrooHtun1980';   
  temp.tx = C2K(36.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 300;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'ADW';
  temp.tp = C2K(36.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '8 to 12 mnth';
data.am = 5*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 2.3;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BrooHtun1980';
data.Wwi = 60;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wwi';
  comment.Wwi = '40 to 80 g';

data.Ri  = 4*4/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(36.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 pups per litter; 4 litters per yr';

% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.101	2.322
1.059	2.647
2.018	2.886
3.002	3.190
4.013	3.537
4.998	4.080
6.035	4.470
6.967	4.774
8.005	5.078
9.016	5.403
10.054	5.729
11.012	5.902
12.024	6.141
13.035	6.423
14.019	6.857
15.031	7.226
15.988	7.638
17.053	7.964
18.011	8.441
18.995	8.962
19.952	9.548];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(42);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'BrooHtun1980';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4RM4P'; % Cat of Life
metaData.links.id_ITIS = '180364'; % ITIS
metaData.links.id_EoL = '328449'; % Ency of Life
metaData.links.id_Wiki = 'Rattus_exulans'; % Wikipedia
metaData.links.id_ADW = 'Rattus_exulans'; % ADW
metaData.links.id_Taxo = '63125'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001742'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rattus_exulans}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Rattus_exulans/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrooHtun1980'; type = 'Article'; bib = [ ... 
'author = {J. E. Brooks and P. T. Htun}, ' ... 
'year = {1980}, ' ...
'title = {Early post-natal growth and behavioural development in the {B}urmese house rat, \emph{Ruttus exuluns}}, ' ...
'journal = {J. Zool., Lond. }, ' ...
'volume = {190}, ' ...
'pages = {125-136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

