function [data, auxData, metaData, txtData, weights] = mydata_Chelon_saliens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Chelon_saliens'; 
metaData.species_en = 'Leaping mullet'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm','MAE'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 08 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 23*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 21.3;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 40;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';               bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm for Mugil cephalus: pi/6*0.09^3';
data.Wwp = 94.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';              bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00977*Lp^2.97, see F1';
data.Wwi = 614;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01072*Li^2.97, see F1';
  
data.Ri  = 346701/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time - length
data.tL_f = [ ... % yr class (yr), std length (cm)
    0  9.14
    1 14.44
    2 17.95
    3 20.70
    4 22.64
    5 24.49
    6 25.70
    7 26.48];
data.tL_f(:,1) = (data.tL_f(:,1) + 1) * 365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2)/0.85; % convert SL to TL
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  bibkey.tL_f = 'KoutSini1994';
temp.tL_f    = C2K(19);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % yr class (yr), std length (cm)
    0  9.28
    1 14.32
    2 17.71
    3 20.04
    4 21.99
    5 24.59
    6 25.84];
data.tL_m(:,1) = (data.tL_m(:,1) + 1) * 365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2)/0.85; % convert SL to TL
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  bibkey.tL_m = 'KoutSini1994';
temp.tL_m    = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
comment.tL_m = 'Data for males';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Ww in g = 0.01072*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.85 * TL'; 
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'TVC8'; % Cat of Life
metaData.links.id_ITIS = '170379'; % ITIS
metaData.links.id_EoL = '49673523'; % Ency of Life
metaData.links.id_Wiki = 'Liza_saliens'; % Wikipedia
metaData.links.id_ADW = 'Liza_saliens'; % ADW
metaData.links.id_Taxo = '5310858'; % Taxonomicon
metaData.links.id_WoRMS = '1042832'; % WoRMS
metaData.links.id_fishbase = 'Chelon-saliens'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chelon_saliens}}';
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
bibkey = 'KoutSini1994'; type = 'Article'; bib = [ ... 
'author = {E. T. Koutrakis and A. I. Sinis}, ' ... 
'year = {1994}, ' ...
'title = {GROWTH ANALYSIS OF GREY MULLETS ({P}ISCES, {M}UGILIDAE) AS RELATED ?? AGE AND SITE}, ' ...
'journal = {Israel J. Zool.}, ' ...
'volume = {40}, ' ...
'pages = {37-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Chelon-saliens.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
