  function [data, auxData, metaData, txtData, weights] = mydata_Fundulus_luciae
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Fundulidae';
metaData.species    = 'Fundulus_luciae'; 
metaData.species_en = 'Spotfin topminnow'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 01]; 

%% set data
% zero-variate data
data.ab = 14;        units.ab = 'd';  label.ab = 'age at birth';     bibkey.ab = 'Byrn1976';
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 175;        units.tp = 'd';  label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(23); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on the remark that a second spawning season is unlikely';
data.am = 365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'Byrn1976';
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 2.9;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'Byrn1976'; 
data.Lpm = 2.55;     units.Lpm = 'cm';     label.Lpm = 'total length at puberty'; bibkey.Lpm = 'Byrn1976'; 
data.Li = 4.7;     units.Li = 'cm';     label.Li = 'ultimate standard length';  bibkey.Li = 'Byrn1976';
data.Lim = 4.0;     units.Lim = 'cm';     label.Lim = 'ultimate standard length for males';  bibkey.Lim = 'Byrn1976';

data.Wwb = 4.2e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Byrn1976';   
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 0.6;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'fishbase','Byrn1976'};   
  comment.Wwi = 'based on 0.00525*Li^3.06, see F1, F2';
data.Wwim = 0.365;  units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = {'fishbase','Byrn1976'};   
  comment.Wwim = 'based on 0.00525*Lim^3.06, see F1, F2';

data.Ri = 16/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'Byrn1976';   
  temp.Ri = C2K(26.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    

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
               
%% Discussion
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00525*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo SL =  0.84 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6JRFR'; % Cat of Life
metaData.links.id_ITIS = '165648'; % ITIS
metaData.links.id_EoL = '46566775'; % Ency of Life
metaData.links.id_Wiki = 'Fundulus_luciae'; % Wikipedia
metaData.links.id_ADW = 'Fundulus_luciae'; % ADW
metaData.links.id_Taxo = '174576'; % Taxonomicon
metaData.links.id_WoRMS = '159307'; % WoRMS
metaData.links.id_fishbase = 'Fundulus-luciae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fundulus_luciae}}';
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
bibkey = 'Byrn1976'; type = 'phdthesis'; bib = [ ...  
'author = {Donald M. Byrne}, ' ...
'year = {1976}, ' ...
'title = {Life History of the Spotfin Killififish, \emph{Fundulus luciae} ({P}isces, {C}yprinodontidae), in {F}ox {C}reek {M}arsh, {V}irginia}, ' ... 
'school = {College of William and Mary in Virginia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Fundulus-luciae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


