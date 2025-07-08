function [data, auxData, metaData, txtData, weights] = mydata_Glyptocephalus_stelleri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Glyptocephalus_stelleri'; 
metaData.species_en = 'Blackfin flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.8); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 09];

%% set data
% zero-variate data
data.ab = 8;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';    
  temp.ab = C2K(4.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 23*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';  
  temp.am = C2K(4.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 26.3;  units.Lp = 'cm';   label.Lp = 'total length at puberty';       bibkey.Lp = 'fishbase';
data.Li = 52;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 6.6e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 134.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00468*Lp^3.14, see F1';
data.Wwi = 1500; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';   bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'max published weight, based on 0.00468*Li^3.14 give 1144 g, see F1';

data.Ri = 101491/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(4.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_fm = [ ... % age (years) ~ Length (cm) 
    5 NaN  22.3
    6 24.8 24.8
    7 28.0 27.9
    8 32.3 31.2
    9 36.8 37.0
   10 39.0 39.6
   11 41.0 41.6
   12 46.0 43.3
   13 46.2 NaN
   14 45.7 43.5
   15 46.3 44.5
   16 47.6 NaN
   17 49.0 NaN
   18 50.8 NaN
   20 50.0 NaN];
data.tL_fm(:,1) = 365 * (0.2+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(4.8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Tokr2008'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % age (years) ~ weight (g)
    5  NaN   81
    6  120  121
    7  185  170
    8  275  232
    9  430  460
   10  565  565 
   11  620  654
   12  920  708
   13 1150  NaN
   14 1058  850
   15 1167  940
   16 1136  NaN
   17 1375  NaN
   18 1500  NaN
   20 1410  NaN];
data.tW_fm(:,1) = 365 * (0.2+data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(4.8);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'Tokr2008'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.tW_fm = 3 * weights.tW_fm;
weights.Wwb = 5 * weights.Wwb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = .1; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only ';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00468*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3GHMS'; % Cat of Life
metaData.links.id_ITIS = '616058'; % ITIS
metaData.links.id_EoL = '46570092'; % Ency of Life
metaData.links.id_Wiki = 'Glyptocephalus_stelleri'; % Wikipedia
metaData.links.id_ADW = 'Glyptocephalus_stelleri'; % ADW
metaData.links.id_Taxo = '175064'; % Taxonomicon
metaData.links.id_WoRMS = '274286'; % WoRMS
metaData.links.id_fishbase = 'Glyptocephalus-stelleri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Glyptocephalus_stelleri}}';
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
bibkey = 'Tokr2008'; type = 'article'; bib = [ ...
'doi = {10.1134/s0032945208090075}' ...
'author = {Tokranov, A. M.}, ' ...
'year   = {2008}, ' ...
'title  = {Specific features of distribution and some features of biology of {K}orean flounder \emph{Glyptocephalus stelleri} ({P}leuronectidae) in waters off {K}amchatka in the {S}ea of {O}khotsk}, ' ... 
'journal = {Journal of Ichthyology}, ' ...
'page = {759–769}, ' ...
'volume = {48(9)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Glyptocephalus-stelleri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
