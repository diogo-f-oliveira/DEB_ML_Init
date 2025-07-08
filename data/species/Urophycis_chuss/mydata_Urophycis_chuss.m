function [data, auxData, metaData, txtData, weights] = mydata_Urophycis_chuss
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Phycidae';
metaData.species    = 'Urophycis_chuss'; 
metaData.species_en = 'Red hake'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 29];

%% set data
% zero-variate data;

data.am = 12*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'guess';   
  temp.am = C2K(9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 26;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'fishbase';
data.Li  = 66;     units.Li  = 'cm';   label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb  = 2.3e-4;   units.Wwb  = 'g';   label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'NAFO';
  comment.Wwb = 'based on egg diameter of 0.76 mm of several Urophycis species: pi/6*0.076^3';
data.Wwp  = 102;  units.Wwp  = 'g';   label.Wwp  = 'ultimate wet weight';    bibkey.Wwp  = 'fishbase';
  comment.Wwp = 'based on W = 0.00407*Lp^3.11, see F1';
data.Wwi  = 1.85e3;  units.Wwi  = 'g';   label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on W = 0.00407*Li^3.11, see F1; max published weight 3.6 kg';

data.Ri = 1.3e6/365;   units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Urophycis tenuis after weight correction: fecundity 15e6*1.85e3/21e3';

% uni-variate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm) 
    1 22.3 19.9
    2 31.3 25.0
    3 35.2 NaN];
data.tL_fm(:,1) = (0.85 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};   label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'Bara1969';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: wet weight in g = 0.00407*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Juveniles live in scallops (Placopecten magellanicus) and remain close to scallop beds until reaching lengths of 90–116 mm';
metaData.bibkey.F2 = 'NAFO';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7DY4B'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46565099'; % Ency of Life
metaData.links.id_Wiki = 'Urophycis_chuss'; % Wikipedia
metaData.links.id_ADW = 'Urophycis_chuss'; % ADW
metaData.links.id_Taxo = '44362'; % Taxonomicon
metaData.links.id_WoRMS = '126503'; % WoRMS
metaData.links.id_fishbase = 'Urophycis-chuss'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urophycis_chuss}}';
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
bibkey = 'Bara1969'; type = 'PhDthesis'; bib = [ ... 
'author = {Charles A. Barans}, ' ... 
'year = {1969}, ' ...
'title = {DISTRIBUTION, GROWTH AND BEHAVIOR OF THE SPOTTED HAKE IN THE {C}HESAPEAKE {B}IGHT}, ' ...
'school = {The College of William and Mary in Virginia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://www.fishbase.se/summary/Urophycis-chuss.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NAFO'; type = 'Misc'; bib = [ ...
'title = {Early Stages of Fishes in the Western North Atlantic Ocean}, ' ...
'howpublished = {\url{https://www.nafo.int/Library/Fahay}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
