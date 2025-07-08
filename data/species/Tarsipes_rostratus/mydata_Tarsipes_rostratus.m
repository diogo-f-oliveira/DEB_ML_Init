function [data, auxData, metaData, txtData, weights] = mydata_Tarsipes_rostratus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Tarsipedidae';
metaData.species    = 'Tarsipes_rostratus'; 
metaData.species_en = 'Honey possum'; 
metaData.ecoCode.climate = {'BSk', 'Csa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(36.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 14]; 


%% set data
% zero-variate data

data.tg = 42;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 90;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 167;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 1.5*365;    units.am = 'd';    label.am = 'life span';           bibkey.am = 'Wiki';   
  temp.am = C2K(36.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 7.5;   units.Li  = 'cm';  label.Li  = 'ultimate body length';   bibkey.Li  = 'Wiki';
  comment.Li = '6.5-9 cm';

data.Wwb = 0.004;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'AnAge';
data.Wwx = 3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';    bibkey.Wwx = 'AnAge';
data.Wwi = 9;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'AnAge';
  comment.Wwi = 'males 11 g, females 8-16 g';

data.Ri  = 9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (d), head length (cm)
11.007	0.300
19.656	0.544
31.450	0.750
40.491	0.881
50.319	1.219
60.541	1.556
70.369	1.856
80.590	2.006
90.418	2.156
100.246	2.213
109.681	2.213
119.902	2.269
130.123	2.288
140.737	2.288
150.958	2.306];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'head length'};  
temp.tL    = C2K(36.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WoolRich1999';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '54XYY'; % Cat of Life
metaData.links.id_ITIS = '609844'; % ITIS
metaData.links.id_EoL = '323836'; % Ency of Life
metaData.links.id_Wiki = 'Tarsipes_rostratus'; % Wikipedia
metaData.links.id_ADW = 'Tarsipes_rostratus'; % ADW
metaData.links.id_Taxo = '60483'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000166'; % MSW3
metaData.links.id_AnAge = 'Tarsipes_rostratus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tarsipes_rostratus}}';
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
bibkey = 'WoolRich1999'; type = 'Article'; bib = [ ... 
'author = {Wooller, R. D. and Richardson, K. C. and Bradley, G. O.}, ' ... 
'year = {1999}, ' ...
'title = {Dietary constraints upon reproduction in an obligate pollenand nectar-feeding marsupial, the honey possum (\emph{Tarsipes rostratus})}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {248}, ' ...
'pages = {279--287}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tarsipes_rostratus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

