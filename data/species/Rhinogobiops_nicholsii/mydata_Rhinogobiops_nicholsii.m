function [data, auxData, metaData, txtData, weights] = mydata_Rhinogobiops_nicholsii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Rhinogobiops_nicholsii'; 
metaData.species_en = 'Blackeye goby'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 03];

%% set data
% zero-variate data

data.ab = 4;   units.ab = 'd';   label.ab = 'life span';                 bibkey.ab = 'guess';   
  temp.ab = C2K(9.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 5*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(9.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 4.7; units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Wile1973'; 
data.Lpm  = 7.2; units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'Wile1973'; 
data.Li  = 15; units.Li = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Wile1973';
  comment.Wwb = 'based on egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwp = 1.1;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01023*Lp^3.02, see F1';
data.Wwi = 36.4;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.02, see F1';

data.Ri  = 5*4788/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wile1973';   
  temp.Ri = C2K(9.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.R = '4788 eggs per spawn, 5 spawns per yr assumed';
 
% uni-variate data

% time-weight
data.tL_fm = [ ... % time (yr), std length (cm)
1 3.093 2.882
2 4.580 4.219
3 5.782 5.975
4 6.808 7.034
5 7.431 7.900];
data.tL_fm(:,1) = (0.5+data.tL_fm(:,1))*365; % convert yr to d
data.tL_fm(:,2:3) = data.tL_fm(:,2:3)*1.18; % convert SL to TL
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm   = C2K(9.8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Wile1973'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
F2 = 'From photo: TL = 1.18 * SL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4S8Y4'; % Cat of Life
metaData.links.id_ITIS = '636877'; % ITIS
metaData.links.id_EoL = '46576294'; % Ency of Life
metaData.links.id_Wiki = 'Rhinogobiops_nicholsii'; % Wikipedia
metaData.links.id_ADW = 'Rhinogobiops_nicholsii'; % ADW
metaData.links.id_Taxo = '185999'; % Taxonomicon
metaData.links.id_WoRMS = '282580'; % WoRMS
metaData.links.id_fishbase = 'Rhinogobiops-nicholsii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinogobiops_nicholsii}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Rhinogobiops-nicholsii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wile1973'; type = 'Article'; bib = [ ... 
'doi = {10.5962/BHL.PART.19964}, ' ...
'author = {Wiley, J.}, ' ... 
'year = {1973}, ' ...
'title = {Life history of the western {N}orth {A}merican goby, \emph{Coryphopterus nicholsii} ({B}ean)}, ' ...
'journal = {Transactions of the San Diego Society of Natural History}, ' ...
'volume = {17}, ' ...
'pages = {187–208}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
