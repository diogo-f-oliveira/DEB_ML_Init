function [data, auxData, metaData, txtData, weights] = mydata_Pomadasys_argyreus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Pomadasys_argyreus'; 
metaData.species_en = 'Bluecheek silver grunt'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 05];

%% set data
% zero-variate data

data.ab = 3.3;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'base on growth at 5 yr';
  
data.Lp  = 13.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'AgatYonv2019'; 
  comment.Lp = 'based on Pomadasys_kaakan: 35*40/80';
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.35e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'AgatYonv2019';
  comment.Wwb = 'based egg diameter of 0.4 mm: pi/6*0.04^3'; 
data.Wwp = 33.9;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'AgatYonv2019','fishbase'};
  comment.Wwp = 'based on 0.01479*Lp^2.99, see F1';
data.Wwi = 912; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^2.99, see F1';

data.Ri  =  5*43182/365;   units.Ri  = '#/d'; label.Ri  = 'reproduction rate at TL 58 cm';   bibkey.Ri  = 'AgatYonv2019';   
  temp.Ri = C2K(28.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 43182 ova each month from May till Sept';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
210.992	5.754
240.253	6.518
273.365	7.075
297.236	7.480
334.968	7.881
362.690	7.925
391.181	8.740
425.833	9.039
485.897	9.640
515.928	9.992
545.190	10.498
577.532	10.489];
data.tL(:,1) = 110 + data.tL(:,1);  % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'InglPaul1984';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01479*(TL in cm)^2.99';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LQKK'; % Cat of Life
metaData.links.id_ITIS = '169098'; % ITIS
metaData.links.id_EoL = '46578445'; % Ency of Life
metaData.links.id_Wiki = 'Pomadasys'; % Wikipedia
metaData.links.id_ADW = 'Pomadasys_argyreus'; % ADW
metaData.links.id_Taxo = '184481'; % Taxonomicon
metaData.links.id_WoRMS = '273499'; % WoRMS
metaData.links.id_fishbase = 'Pomadasys-argyreus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomadasys}}';
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
bibkey = 'InglPaul1984'; type = 'techreport'; bib = [ ... 
'author = {Ingles, J. and D. Pauly}, ' ... 
'year = {1984}, ' ...
'title = {An atlas of the growth, mortality and recruitment of {P}hilippines fishes}, ' ...
'institution = {ICLARM, International Center for Living Aquatic Resources Management, Manila, Philippines}, ' ...
'volume = {Tech. Rep. 13.}, '...
'pages = {127 p.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AgatYonv2019'; type = 'article'; bib = [ ... 
'author = {Mona Agatha and Yonvitner and Rahmat Kurnia}, ' ... 
'year = {2019}, ' ...
'title = {Gonad Maturity and Fecundity of Bluecheek Silver Grunt (\emph{Pomadasys argyreus}) in {P}alabuhanratu {B}ay, {W}est {J}ava}, ' ...
'journal = {Journal of Tropical Fisheries Management}, ' ...
'volume = {3(1)}, '...
'pages = {10-25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pomadasys-argyreus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
