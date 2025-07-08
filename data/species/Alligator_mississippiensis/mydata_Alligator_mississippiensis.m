function [data, auxData, metaData, txtData, weights] = mydata_Alligator_mississippiensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Alligatoridae';
metaData.species    = 'Alligator_mississippiensis'; 
metaData.species_en = 'American alligator'; 

metaData.ecoCode.climate = {'Aw', 'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biFp', 'biFp', 'biFr'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, JacoKush1989: envir temp between 21 and 29
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Ww0'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 26];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 04 26];

%% set data
% zero-variate data

data.ab = 65;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'myfwc';   
  temp.ab = C2K(32); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Mass1993 gives 52';
data.ap = 11*365;  units.ap = 'd';    label.ap = 'age at puberty for female';  bibkey.ap = 'mom';
  temp.ap = C2K(25); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 80*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'defenders';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 180;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki'; 
data.Li  = 304;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'myfwc';
data.Lim  = 440;   units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';

data.Ww0 = 70;     units.Ww0 = 'g';   label.Ww0 = 'egg wet weight';          bibkey.Ww0 = 'DeemFerg1991';
data.Wwim = 450e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';

data.Ri  = 46/365;   units.Ri  = '#/d'; label.Ri  = 'reprod rate at 364 cm';   bibkey.Ri  = 'myfwc';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), snout to vent length (cm)
413.199     12.048
619.799     17.021
878.049     25.244
1119.082	31.364
1687.231	37.107
1911.047	42.844
2255.380	48.010
2737.446	51.458
3098.996	57.007
3340.029	61.216
3632.712	63.323
3977.044	65.813
4424.677	68.114
4665.710	71.367
4958.393	73.474
5302.726	76.346
5629.842	81.130
5974.175	83.046
6232.425	86.873
6490.674	90.509
6852.224	92.617
7196.557	96.063
7644.189	100.084
7988.522	100.854
8384.505	101.051
8711.621	103.159
9038.737	104.693
9486.370	110.625
9985.653	114.838
10622.669	120.200
11001.435	119.824];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'snout-to-vent length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'JacoKush1989'};
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL*10;

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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: k_J fixed at 0.002 J/d, food taken variable in tL data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'temperature effects sex of neonate: below  30 C neonates are female and above 34 C male';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'BTRB'; % Cat of Life
metaData.links.id_ITIS = '551771'; % ITIS
metaData.links.id_EoL = '796029'; % Ency of Life
metaData.links.id_Wiki = 'Alligator_mississippiensis'; % Wikipedia
metaData.links.id_ADW = 'Alligator_mississippiensis'; % ADW
metaData.links.id_Taxo = '50616'; % Taxonomicon
metaData.links.id_WoRMS = '886665'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Alligator&species=mississippiensis'; % ReptileDB
metaData.links.id_AnAge = 'Alligator_mississippiensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alligator_mississippiensis}}';
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
bibkey = 'DeemFerg1991'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Deeming, D. C. and Ferguson}, ' ...
'year = {1991}, ' ...
'title  = {Egg incubation; its effects on embryonic development in birds and reptiles}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JacoKush1989'; type = 'Article'; bib = [ ... 
'author = {Jacobson, T. and Kushlan, J. A.}, ' ... 
'year = {1989}, ' ...
'title = {Growth dynamics in the {A}merican alligator (\emph{Alligator mississipiensis})}, ' ...
'journal = {J. Zool. Lond.}, ' ...
'volume = {219}, ' ...
'pages = {309-328}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mass1993'; type = 'Techreport'; bib = [ ... 
'author = {Masser, m. P.}, ' ... 
'year = {1989}, ' ...
'title = {Alligator  production; breeding and egg incubation}, ' ...
'intitution = {SRAC}, ' ...
'volume = {231}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'mom'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animals.mom.me/gestation-alligator-eggs-7957.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'myfwc'; type = 'Misc'; bib = ...
'howpublished = {\url{http://myfwc.com/wildlifehabitats/managed/alligator/facts/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'defenders'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.defenders.org/american-alligator/basic-facts}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

