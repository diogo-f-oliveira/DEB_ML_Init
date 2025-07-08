function [data, auxData, metaData, txtData, weights] = mydata_Ocyurus_chrysurus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Ocyurus_chrysurus'; 
metaData.species_en = 'Yellow snapper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr', 'jpMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 17];

%% set data
% zero-variate data

data.ab = 7;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(25.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ArauMart2002';   
  temp.am = C2K(25.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 23.8; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'range 28 to 40 cm, which does not include 52 cm';
data.Li  = 86.3;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: 4/3*pi*0.0425^3'; 
data.Wwp = 174; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01514*Lp^2.95, see F1'; 
data.Wwi = 7.8e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight 4.1 kg; based on 0.01514*Li^2.95, see F1, gives 7.8 kg'; 

data.Ri  = 164756/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 10.8
    2 18.7
    3 23.0
    4 26.0
    5 28.8
    6 31.3
    7 35.0
    8 37.7
    9 40.8
   10 44.6
   11 45.1
   12 46.8
   13 48.9
   14 49.9
   15 47.6
   16 49.0
   17 50.5
   18 51.5
   19 52.4];
data.tL(:,1) = 365 * (.5+data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ArauMart2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01514*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '48MRB'; % Cat of Life
metaData.links.id_ITIS = '168907'; % ITIS
metaData.links.id_EoL = '46580791'; % Ency of Life
metaData.links.id_Wiki = 'Ocyurus_chrysurus'; % Wikipedia
metaData.links.id_ADW = 'Ocyurus_chrysurus'; % ADW
metaData.links.id_Taxo = '45271'; % Taxonomicon
metaData.links.id_WoRMS = '159803'; % WoRMS
metaData.links.id_fishbase = 'Ocyurus-chrysurus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ocyurus_chrysurus}}';
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
bibkey = 'ArauMart2002'; type = 'Article'; bib = [ ... 
'author = {J\''{u}lio Neves de Ara\''{u}jo and Agnaldo Silva Martins and Karla Gon\c{c}alves da Costa}, ' ... 
'year = {2002}, ' ...
'title = {Idades e  crescimento  da cioba,  \emph{Ocyururs chrysurus}, da  {C}osta  {C}entral  do  {B}rasil}, ' ...
'journal = {Rev. bras. oceanor.}, ' ...
'volume = {50}, ' ...
'pages = {47-57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Ocyurus-chrysurus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
