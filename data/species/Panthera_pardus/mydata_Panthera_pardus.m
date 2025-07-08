function [data, auxData, metaData, txtData, weights] = mydata_Panthera_pardus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Panthera_pardus'; 
metaData.species_en = 'Leopard'; 

metaData.ecoCode.climate = {'A', 'B'};
metaData.ecoCode.ecozone = {'TPa', 'TPi'};
metaData.ecoCode.habitat = {'0iT'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 04];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 09 04]; 

%% set data
% zero-variate data

data.tg = 97;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '90 till 100 d';
data.tx = 110;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 937;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 771;    units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.9);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 27.3*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 550;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 1940;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 55e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';  
  comment.Wwi = '28 to 60 kg';
data.Wwim = 80e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'Wiki';  
  comment.Wwim = '37 to 90 kg';

data.Ri  = 1.25*2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(37.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter, 1.25 litters per yr';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time (d), female body weight (g)
  9   850
 15  1180
 30  1680
 40  1980
 50  2950
 61  4520
 71  6200
 80  6710
 95  6710
116  7820
177 13400];
units.tW_f = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight'};  
temp.tW_f  = C2K(37.9);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'KoivWahl1977';
comment.tW_f = 'data for female cup';
%
data.tW_f1 = [ ... % time (d), female body weight (g)
  9   970
 15  1340
 30  1840
 40  2160
 50  3250
 61  4080
 71  5020
 80  6480
 95  7110
116  7820
177 13400
280 25800];
units.tW_f1 = {'d', 'g'};  label.tW_f1 = {'time since birth', 'wet weight'};  
temp.tW_f1  = C2K(37.9);  units.temp.tW_f1 = 'K'; label.temp.tW_f1 = 'temperature';
bibkey.tW_f1 = 'KoivWahl1977';
comment.tW_f1 = 'data for female cup';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_f1 = 5 * weights.tW_f1;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_f1'}; subtitle1 = {'Data for females 1 and 2'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Body temperature is guessed';
D3 = 'Wwx is ignored, due to inconsistency of (tx,Wwx) with tW data';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'Males may be slightly larger than females';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CGXR'; % Cat of Life
metaData.links.id_ITIS = '183804'; % ITIS
metaData.links.id_EoL = '328673'; % Ency of Life
metaData.links.id_Wiki = 'Panthera_pardus'; % Wikipedia
metaData.links.id_ADW = 'Panthera_pardus'; % ADW
metaData.links.id_Taxo = '67285'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000250'; % MSW3
metaData.links.id_AnAge = 'Panthera_pardus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Panthera_pardus}}';
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
bibkey = 'Carv1968'; type = 'Article'; bib = [ ... 
'author = {Carvalho, C. T. D.}, ' ... 
'doi = {10.1111/j.1748-1090.1968.tb00436.x}, ' ...
'year = {1968}, ' ...
'title = {Comparative growth rates of hand-reared big cats}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {8}, ' ...
'pages = {56-59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Panthera_pardus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Panthera_pardus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

