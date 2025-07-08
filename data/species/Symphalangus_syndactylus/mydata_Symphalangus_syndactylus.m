function [data, auxData, metaData, txtData, weights] = mydata_Symphalangus_syndactylus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Hylobatidae';
metaData.species    = 'Symphalangus_syndactylus'; 
metaData.species_en = 'Siamang'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiHl', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 20];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 20]; 

%% set data
% zero-variate data

data.tg = 231;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 642;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2190;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 43*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 80;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'ADW';
  comment.Li = '71-90 cm';

data.Wwb = 519;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 2600; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
  comment.Wwx = 'read from t-Ww data at 642 g';
data.Wwi = 10900; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/607; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data for 3 individuals in Perth Zoo
data.tW1 = [ ... % time since birth (d), wet weight (g)
 40  642
 50  656
 60  640
 70  644
 80  742
 90  830
120 1052
150 1174
180 1282
210 1400
240 1520
270 1500
300 1700
330 1750
360 1850
400 2000
450 2100
500 2300];
units.tW1  = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1   = C2K(37.5);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Rile2008';
comment.tW1 = 'Jermei in Perth Zoo';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
  2  560
 10  638
 20  742
 30  824
 40  908
 50  970
 60 1034
 70 1024
 80 1030
 90 1096
120 1199
150 1362
180 1500
210 1590
240 1688
270 1800];
units.tW2  = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2   = C2K(37.5);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Rile2008';
comment.tW2 = 'Meili in Perth Zoo';
%
data.tW3 = [ ... % time since birth (d), wet weight (g)
  2  552
 10  593
 20  688
 30  748
 40  796
 50  832
 60  874
 70  916
 80  950
 90  954
120 1118
150 1258
180 1410
210 1588
240 1660
270 1872
300 2036
330 2207
360 2364];
units.tW3  = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight'};  
temp.tW3   = C2K(37.5);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'Rile2008';
comment.tW3 = 'Lily in Perth Zoo';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2','tW3'}; subtitle1 = {'Data for Jermei, Meili, Lily'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '7B78J'; % Cat of Life
metaData.links.id_ITIS = '944293'; % ITIS
metaData.links.id_EoL = '1038643'; % Ency of Life
metaData.links.id_Wiki = 'Symphalangus_syndactylus'; % Wikipedia
metaData.links.id_ADW = 'Symphalangus_syndactylus'; % ADW
metaData.links.id_Taxo = '66199'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100785'; % MSW3
metaData.links.id_AnAge = 'Symphalangus_syndactylus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Symphalangus_syndactylus}}';
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
bibkey = 'Rile2008'; type = 'Techreport'; bib = [ ... 
'author = {Riley, R. W.}, ' ... 
'year = {2008}, ' ...
'title = {Husbandry manual for siamang \emph{Hylobates syndactylus}}, ' ...
'howpublished = {\url{http://nswfmpa.org/Husbandry Manuals/Published Manuals/Mammalia/Siamang.pdf}}, ' ...
'institution = {Western Sydney Institute of TAFE, Richmond}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Symphalangus_syndactylus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Symphalangus_syndactylus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

