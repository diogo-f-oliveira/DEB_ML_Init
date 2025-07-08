function [data, auxData, metaData, txtData, weights] = mydata_Felis_chaus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Felis_chaus'; 
metaData.species_en = 'Jungle cat'; 

metaData.ecoCode.climate = {'A', 'B', 'C'};
metaData.ecoCode.ecozone = {'THp','TPi'};
metaData.ecoCode.habitat = {'0iTh','0iTi','0iTs','0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiC'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 10 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 10 30]; 

%% set data
% zero-variate data

data.tg = 60;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(39.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 90;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 335;    units.tp = 'd';    label.tp = 'time since birth at puberty for females';   bibkey.tp = 'AnAge';
  temp.tp = C2K(39.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*65;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 131;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 2213;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';  bibkey.Wwx = 'AnAge';
data.Wwi = 16000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 3*2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 cups per litter, 2 litters per r';

% uni-variate data

% time-weight data
data.tW_1f = [ ... % time (d), weight (g)
    0  161
    3  220
    7  305
   16  460
   30  950
   60 1800
   90 2300];
units.tW_1f   = {'d', 'g'};  label.tW_1f = {'time since birth', 'weight'};  
temp.tW_1f    = C2K(39.8);  units.temp.tW_1f = 'K'; label.temp.tW_1f = 'temperature';
bibkey.tW_1f = 'Scha1979';
comment.tW_1f = 'Data for female';
%
data.tW_2f = [ ... % time (d), weight (g)
    0  160
    3  220
    7  300
   16  445
   30  820
   60 1720
   90 2250];
units.tW_2f   = {'d', 'g'};  label.tW_2f = {'time since birth', 'weight'};  
temp.tW_2f    = C2K(39.8);  units.temp.tW_2f = 'K'; label.temp.tW_2f = 'temperature';
bibkey.tW_2f = 'Scha1979';
comment.tW_2f = 'Data for female';
%
data.tW_3f = [ ... % time (d), weight (g)
    0  154
    3  216
    7  290
   16  435
   30  800
   60 1700
   90 2200];
units.tW_3f   = {'d', 'g'};  label.tW_3f = {'time since birth', 'weight'};  
temp.tW_3f    = C2K(39.8);  units.temp.tW_3f = 'K'; label.temp.tW_3f = 'temperature';
bibkey.tW_3f = 'Scha1979';
comment.tW_3f = 'Data for female';
%
data.tW_4f = [ ... % time (d), weight (g)
    0  150
    3  210
    7  280
   16  430
   30  650
   60 1650
   90 2100];
units.tW_4f   = {'d', 'g'};  label.tW_4f = {'time since birth', 'weight'};  
temp.tW_4f    = C2K(39.8);  units.temp.tW_4f = 'K'; label.temp.tW_4f = 'temperature';
bibkey.tW_4f = 'Scha1979';
comment.tW_4f = 'Data for female';


%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_1f','tW_2f','tW_3f','tW_4f'}; subtitle1 = {'Data for 4 females'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'Males are assumed not to differ from females, due to lack of data';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '3DXV4'; % Cat of Life
metaData.links.id_ITIS = '183802'; % ITIS
metaData.links.id_EoL = '328671'; % Ency of Life
metaData.links.id_Wiki = 'Felis_chaus'; % Wikipedia
metaData.links.id_ADW = 'Felis_chaus'; % ADW
metaData.links.id_Taxo = '112283'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000032'; % MSW3
metaData.links.id_AnAge = 'Felis_chaus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Felis_chaus}}';
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
bibkey = 'Scha1979'; type = 'Article'; bib = [ ... 
'doi = {10.1515/mamm.1979.43.2.215}, ' ...
'author = {Schauenberg, P.}, ' ... 
'year = {1979}, ' ...
'title = {La reproduction du Chat des marais \emph{Felis chaus} (G\"{u}ldenst\"{a}dt, 1776)}, ' ...
'journal = {Mammalia}, ' ...
'volume = {43(2)}, ' ...
'pages = {177-198}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Felis_chaus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

