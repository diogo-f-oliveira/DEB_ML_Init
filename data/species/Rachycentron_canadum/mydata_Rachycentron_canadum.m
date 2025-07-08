function [data, auxData, metaData, txtData, weights] = mydata_Rachycentron_canadum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Rachycentridae';
metaData.species    = 'Rachycentron_canadum'; 
metaData.species_en = 'Cobia'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 08];

%% set data
% zero-variate data

data.ab = 4.55;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(12.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15 * 365;     units.am = 'd';      label.am = 'life span';        bibkey.am = 'fishbase';   
  temp.am = C2K(12.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 69.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Lpm = 51.8;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty'; bibkey.Lpm  = 'Rich2011'; 
data.Li  = 200;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.4e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fao';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwp = 2.27e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Rich2011';
  comment.Wwp = 'fishbase: 0.00479*Lp^3.11 gives 2.57 kg, see F1';
data.Wwpm = 1135; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty';    bibkey.Wwpm = 'Rich2011';
  comment.Wwpm = 'fishbase : 0.00479*Lp^3.11 gives 1028 g, see F1';
data.Wwi = 68.6e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight 68.0 kg, based on 0.00479*Li^3.11, see F1';

data.Ri = 5.4e6/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';    bibkey.Ri = 'fishbase';
  temp.Ri = C2K(12.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length 
data.tL_fm =	[ % time since birth (yr), total length (inch)
    1 14.2 13.8
    2 23.8 23.1
    3 32.0 28.8
    4 37.0 32.9
    5 41.4 36.2
    6 44.1 38.3
    7 46.6 39.1
    8 48.7 40.3
    9 50.3 42.5
   10 NaN  45.9];
data.tL_fm(:,1) = 365 * (-0.35 + data.tL_fm(:,1)); % convert yr to d
data.tL_fm(:,2:3) = data.tL_fm(:,2:3)*2.54; % convert inch to cm
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
treat.tL_fm = {1 {'females','males'}};
temp.tL_fm    = C2K(12.9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Rich2011';
  
%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00479*(TL in cm)^3.11'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length: SL in cm = 0.903 * (TL in cm) - 1.05 cm';
metaData.bibkey.F2 = 'Rich2011';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4R8GD'; % Cat of Life
metaData.links.id_ITIS = '168566'; % ITIS
metaData.links.id_EoL = '46578916'; % Ency of Life
metaData.links.id_Wiki = 'Rachycentron_canadum'; % Wikipedia
metaData.links.id_ADW = 'Rachycentron_canadum'; % ADW
metaData.links.id_Taxo = '153540'; % Taxonomicon
metaData.links.id_WoRMS = '127006'; % WoRMS
metaData.links.id_fishbase = 'Rachycentron-canadum'; % fishbase168566

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rachycentron_canadum}}';
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
bibkey = 'Rich2011'; type = 'Article'; bib = [ ... 
'doi = {10.1577/1548-8659(1967)96[343:AGAFOT]2.0.CO;2}, ' ...
'author = {C. E. Richards}, ' ... 
'year = {2011}, ' ...
'title = {Age, growth and fecundity of the cobia, \emph{Rachycentron canadum}, from {C}hesapeake {B}ay and adjacent {M}id-{A}tlantic waters}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {96(3)}, ' ...
'pages = {343-350}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Rachycentron-canadum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fao'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fao.org/fishery/docs/CDrom/aquaculture/I1129m/file/en/en_cobia.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

