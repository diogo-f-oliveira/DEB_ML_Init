function [data, auxData, metaData, txtData, weights] = mydata_Acipenser_schrenckii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Acipenser_schrenckii'; 
metaData.species_en = 'Amur sturgeon'; 

metaData.ecoCode.climate = {'MC','Dfb'};
metaData.ecoCode.ecozone = {'MPNW','THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp 
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 04];

%% set data
% zero-variate data;
data.tp = 12*365; units.tp = 'd';  label.tp = 'time since birth at puberty';      bibkey.tp = 'KrykSvir1997';   
  temp.tp = C2K(15);units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 60*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'KrykSvir1997';   
  temp.am = C2K(15);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 133;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'KrykSvir1997';
  comment.Lp = '125-143 cm';
data.Li  = 346;      units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.56e-2;    units.Wwb = 'g';   label.Wwb = 'wet weight birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.7–3.4 mm: pi/6*0.31^3';
data.Wwp = 13.3e3;    units.Wwp = 'g';   label.Wwp = 'uwet weight at puberty';   bibkey.Wwp = 'KrykSvir1997';
  comment.Wwp = '8.3-16.4 kg';
data.Wwi = 190e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'KrykSvir1997';
  comment.Wwi = 'based on 0.00324*Li^3.17, see F1';
 
data.Ri  = 1.3e6/365/4; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'KrykSvir1997: spawning year 4 yrs';
  
% uni-variate data

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

%% Discussion points
D1 = 'Males are supposed not to differ from females; data refer to gray form';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00269*(TL in cm)^3.24';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Amur sturgeon is restricted to the Amur River system; grey form grows larger than brown form';
metaData.bibkey.F2 = 'KrykSvir1997'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '9C7C'; % Cat of Life
metaData.links.id_ITIS = '550554'; % ITIS
metaData.links.id_EoL = '46561180'; % Ency of Life
metaData.links.id_Wiki = 'Acipenser_schrenckii'; % Wikipedia
metaData.links.id_ADW = 'Acipenser_schrenckii'; % ADW
metaData.links.id_Taxo = '160089'; % Taxonomicon
metaData.links.id_WoRMS = '271698'; % WoRMS
metaData.links.id_fishbase = 'Acipenser-schrenckiis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acipenser_schrenckii}}';  
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
bibkey = 'KrykSvir1997'; type = 'Article'; bib = [ ...  
'doi = {10.1023/a:1007358027263}, ' ...
'author = {Krykhtin, M. L. and Svirskii, V. G.}, ' ...
'year = {1997}, ' ...
'title = {Endemic sturgeons of the {A}mur {R}iver: kaluga, \emph{Huso dauricus}, and {A}mur sturgeon, \emph{Acipenser schrenckii}}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {48(1/2/3/4)}, ' ...
'pages = {231–239}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acipenser_schrenckii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

