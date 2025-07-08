function [data, auxData, metaData, txtData, weights] = mydata_Myocastor_coypus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Echimyidae';
metaData.species    = 'Myocastor_coypus'; 
metaData.species_en = 'Coypu'; 

metaData.ecoCode.climate = {'Aw', 'Cwa', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm', '0iFr'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Wwe'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 24]; 

%% set data
% zero-variate data

data.tg = 131;     units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 91;     units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(34.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 152;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(34.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 225;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'AnAge';
data.Wwx = 1750;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';       bibkey.Wwx = 'AnAge';
data.Wwi = 7850;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'AnAge';

data.Ri  = 6*2.3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 pups per litter; 2.3 litters per yr';
  
% univariate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (kg)
1.214	0.228
29.845	0.705
60.425	1.069
89.115	1.338
119.008	1.872
151.496	2.274
182.033	2.790
210.739	3.002
241.394	3.100
272.034	3.255
303.034	4.397
334.184	5.007
361.940	6.320
394.019	5.906
425.867	6.307
455.533	5.381
485.920	6.428
516.907	5.349];
data.tW(:,2) = 1e3 * data.tW(:,2); % convert kg to g
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(34.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Pelo1969';

% time-length of foetes
tLe = [ ... % age (d), crown-rump length (cm)
 62.5  3.20
 72.5  4.98
 82.5  7.57
 92.5  7.23
102.5 10.50
112.5 11.00
122.5 12.97];
data.tWe = [tLe(:,1), (tLe(:,2)/ 13).^3 * 225]; % convert length to weight
units.tWe   = {'d', 'g'};  label.tWe = {'age', 'foetal weight'};  
temp.tWe    = C2K(34.6);  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'SoneKoya2008';
comment.tWe = 'Converted from crown-rump length to weight by Ww(t) = Wwb*(L(t)/L(ab))^3';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 10 * weights.psd.v;
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '6RRQT'; % Cat of Life
metaData.links.id_ITIS = '180402'; % ITIS
metaData.links.id_EoL = '328471'; % Ency of Life
metaData.links.id_Wiki = 'Myocastor_coypus'; % Wikipedia
metaData.links.id_ADW = 'Myocastor_coypus'; % ADW
metaData.links.id_Taxo = '63540'; % Taxonomicon
metaData.links.id_WoRMS = '594792'; % WoRMS
metaData.links.id_MSW3 = '13400557'; % MSW3
metaData.links.id_AnAge = 'Myocastor_coypus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myocastor_coypus}}';
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
bibkey = 'SoneKoya2008'; type = 'Article'; bib = [ ... 
'author = {K. Sone and K. Koyasu and S. Kobayashi and S. Oda}, ' ... 
'year = {2008}, ' ...
'title = {Fetal growth and development of the coypu (\emph{Myocastor coypus}): Prenatal growth, tooth eruption, and cranial ossification}, ' ...
'journal = {Mamm. biol. 73}, ' ...
'volume = {73}, '...
'pages = {350-357}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pelo1969'; type = 'Phdthesis'; bib = [ ... 
'author = {E. P. Peloquin}, ' ... 
'year = {1969}, ' ...
'title = {Growth and Reproduction of the Feral Nutria \emph{Myocastor coypus} ({M}olina) Near {C}orvallis, {O}regon}, ' ...
'school = {Oregon State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Myocastor_coypus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

