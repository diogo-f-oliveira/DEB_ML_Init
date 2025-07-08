function [data, auxData, metaData, txtData, weights] = mydata_Glaucomys_volans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Glaucomys_volans'; 
metaData.species_en = 'Southern flying squirrel'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2017 12 30];              

%% set data
% zero-variate data

data.tg = 40;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 58;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 210;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 19*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 3.35;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 46.2;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 65.4;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 6*1.8/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 pups per litter; 1.3 litters per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (wk), wet weight (g)
0  3.9
1  7.5
2 12.4
3 20.2
4 29.4
5 37.1
6 40.9
7 44.9
8 49.7];
data.tW(:,1) = data.tW(:,1) * 7; % covert wk to d
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight', 'summer'};  
temp.tW    = C2K(39);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'StapMaut1991';
comment.tW = 'Data for summer';
%
data.tW1 = [ ... % time (d), wet weight (g)
0  4.6
1  8.3
2 12.8
3 18.4
4 23.4
5 27.1
6 32.9
7 36.9
8 40.2];
data.tW1(:,1) = data.tW1(:,1) * 7; % covert wk to d
units.tW1   = {'d', 'g'};  label.tW1 = {'time', 'wet weight', 'spring'};  
temp.tW1    = C2K(39);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'StapMaut1991';
comment.tW1 = 'Data for spring';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 5 * weights.Ri;
weights.tp = 50 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
%weights.psd.v = 5 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data for summer, spring'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '3G6FQ'; % Cat of Life
metaData.links.id_ITIS = '180170'; % ITIS
metaData.links.id_EoL = '347431'; % Ency of Life
metaData.links.id_Wiki = 'Glaucomys_volans'; % Wikipedia
metaData.links.id_ADW = 'Glaucomys_volans'; % ADW
metaData.links.id_Taxo = '61979'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12400328'; % MSW3
metaData.links.id_AnAge = 'Glaucomys_volans'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Glaucomys_volans}}';
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
bibkey = 'StapMaut1991'; type = 'Article'; bib = [ ... 
'author = {P. Stapp and W. W. Mautz}, ' ... 
'year = {1991}, ' ...
'title = {Breeding Habits and Postnatal Growth of the Southern Flying Squirrel (Glaucomys volans)in New Hampshire}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {126}, ' ...
'pages = {203--208}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Glaucomys_volans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

