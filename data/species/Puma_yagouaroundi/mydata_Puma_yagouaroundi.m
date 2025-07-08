function [data, auxData, metaData, txtData, weights] = mydata_Puma_yagouaroundi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Puma_yagouaroundi'; 
metaData.species_en = 'Yagouaroundi'; 

metaData.ecoCode.climate = {'A', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iT'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiC'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 73;    units.tg = 'd';    label.tg = 'gestation time';                   bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 35;    units.tx = 'd';    label.tx = 'time since birth at weaning';     bibkey.tx = 'BuzaGuly2012';   
  temp.tx = C2K(38.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 803;   units.tp = 'd';    label.tp = 'time since birth at puberty';     bibkey.tp = 'AnAge';
  temp.tp = C2K(38.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 18.6*365; units.am = 'd';    label.am = 'life span';                       bibkey.am = 'AnAge';   
  temp.am = C2K(38.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 277.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'AnAge';
data.Wwi = 7e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';  bibkey.Wwi = 'Wiki';
data.Wwim = 7.5e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'Wiki';
  comment.Wwim = 'based on males are slightly larger than females';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter, 02 litters per yr';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), female body weight (g)
    4  190
    7  246
   14  359
   21  481
   28  667
   35  748
   42  945
   49 1075
   56 1170
   63 1227
   70 1311
   77 1615
   84 1652
   91 1670
   98 1880
  105 2050
  112 2192
  119 2302
  126 2402
  133 2322
  140 2416];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(38.4);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'BuzaGuly2012';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (d), male body weight (g) 
    4  187
    7  257
   14  344
   21  455
   28  630
   35  741
   42  960
   49 1155
   56 1263
   63 1362
   70 1430
   77 1715
   84 1656
   91 1765
   98 1980
  105 2140
  112 2322
  119 2380
  126 2462
  133 2517
  140 2590];
units.tW_m   = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(38.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'BuzaGuly2012';
comment.tW_m = 'data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 3 * weights.tW_f;
weights.tW_m = 3 * weights.tW_m;
weights.Wwi = 5 * weights.Wwi;
weights.Wwim = 5 * weights.Wwim;
weights.Ri = 5 * weights.Ri;

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

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Weight at weaning ignored because of inconsistence of (tx,Wwx) with tW-data';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'Several subspecies that differ in size';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7F2KC'; % Cat of Life
metaData.links.id_ITIS = '180544'; % ITIS
metaData.links.id_EoL = '328582'; % Ency of Life
metaData.links.id_Wiki = 'Puma_yagouaroundi'; % Wikipedia
metaData.links.id_ADW = 'Puma_yagouaroundi'; % ADW
metaData.links.id_Taxo = '1684121'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000211'; % MSW3
metaData.links.id_AnAge = 'Puma_yagouaroundi'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Puma_yagouaroundi}}';
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
bibkey = 'BuzaGuly2012'; type = 'Article'; bib = [ ... 
'author = {Balazs Buzas and Eszter Gulyas}, ' ... 
'year = {2012}, ' ...
'title = {Hand-Raising Jaguarundis (\emph{Puma yagouaroundi})}, ' ...
'journal = {Feline Conservation Federation}, ' ...
'volume = {56(2)}, ' ...
'pages = {20-22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Puma_yagouaroundi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

