function [data, auxData, metaData, txtData, weights] = mydata_Diaphus_suborbitalis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Diaphus_suborbitalis'; 
metaData.species_en = 'Lanternfish'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MI','MP'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.3); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 31];

%% set data
% zero-variate data
data.am = 2.5*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'GoKawa1977';  
  temp.am = C2K(6.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.8;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
  comment.Lp = 'based in Diaphus_dumerilii: 2.5*7.3/6.5';
data.Li = 7.3;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm of Diaphus_dumerilii: pi/6*0.05^3';
data.Wwp = 0.173; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'guess','fishbase'};  
  comment.Wwp = 'based on (Lp/Li)^3*Wwi: (2.8/7.3)^3*3.07, see F1';
data.Wwi = 3.07;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00759*Li^3.02, see F1';

data.Ri = 9.8; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(6.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% tL data
data.tL = [ ... % time since birth (d), standard length (cm) 
    0.5 3.210
    1.0 4.490
    1.5 5.071
    2.0 5.039
    2.5 5.741];
data.tL(:,1) = (0.9+data.tL(:,1))*365;
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(6.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GoKawa1977';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Length-Weight relationship: W in g =  0.00759*(SL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '35CKZ'; % Cat of Life
metaData.links.id_ITIS = '623801'; % ITIS
metaData.links.id_EoL = '46564121'; % Ency of Life
metaData.links.id_Wiki = 'Diaphus_suborbitalis'; % Wikipedia
metaData.links.id_ADW = 'Diaphus_suborbitalis'; % ADW
metaData.links.id_Taxo = '173094'; % Taxonomicon
metaData.links.id_WoRMS = '272693'; % WoRMS
metaData.links.id_fishbase = 'Diaphus-suborbitalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diaphus}}';
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
bibkey = 'GoKawa1977'; type = 'article'; bib = [ ...
'doi = {10.2331/suisan.43.913}, ' ...
'author = {Go, You Bong and Kawaguchi, Kouichi and Kusaka, Takaya}, ' ... 
'year   = {1977}, ' ...
'title  = {Ecologic study on \emph{Diaphus suborbitalis} {W}EBER ({P}isces, {M}yctophidae) in {S}uruga {B}ay, {J}apan-I. {M}ethof of aging and its life span}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'page = {913–919}, ' ...
'volume = {43(8)'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Diaphus-dumerilii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

