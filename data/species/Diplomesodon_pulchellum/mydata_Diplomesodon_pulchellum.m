function [data, auxData, metaData, txtData, weights] = mydata_Diplomesodon_pulchellum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Soricidae';
metaData.species    = 'Diplomesodon_pulchellum'; 
metaData.species_en = 'Piebald shrew'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 05 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 05 25]; 

%% set data
% zero-variate data

data.tg = 27;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'guess';   
  temp.tg = C2K(37.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 22;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ZaytVolo2015';   
  temp.tx = C2K(37.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 4*30;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(37.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3.2*365;    units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(37.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ZaytVolo2015';
data.Wwx = 7.5;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'ZaytVolo2015';
  comment.Wwx = 'from tW dat at tx';
data.Wwi = 9;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ZaytVolo2015';
  comment.Wwi = 'EoL gives 11 g';

data.Ri  = 4*5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = {'EoL','ZaytVolo2015'};   
  temp.Ri = C2K(37.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 to 6 pups per litter, assumed: 4 litters per yr';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
1.050	1.043
3.032	1.576
4.933	2.571
7.000	3.590
8.984	4.561
11.091	5.531
12.949	5.991
14.973	6.670
16.996	7.178
19.018	7.492
21.079	7.441];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ZaytVolo2015';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = '';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '36LXF'; % Cat of Life
metaData.links.id_ITIS = '633704'; % ITIS
metaData.links.id_EoL = '1178894'; % Ency of Life
metaData.links.id_Wiki = 'Diplomesodon_pulchellum'; % Wikipedia
metaData.links.id_ADW = 'Diplomesodon_pulchellum'; % ADW
metaData.links.id_Taxo = '61194'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13700253'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diplomesodon_pulchellum}}';
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
bibkey = 'ZaytVolo2015'; type = 'Article'; bib = [ ...
'doi = {10.1016/j.beproc.2015.06.012}, ' ...
'author = {Alexandra S. Zaytseva and Ilya A. Volodin and Matthew J. Mason and Roland Frey and Guido Fritsch and Olga G. Ilchenko and Elena V. Volodina}, ' ... 
'year = {2015}, ' ...
'title = {Vocal development during postnatal growth and ear morphology in a shrew that generates seismic vibrations, \emph{Diplomesodon pulchellum}}, ' ...
'journal = {Behavioural Processes}, ' ...
'volume = {118}, ' ...
'pages = {130-141}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1178894}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

