  function [data, auxData, metaData, txtData, weights] = mydata_Hemibarbus_labeo
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Hemibarbus_labeo'; 
metaData.species_en = 'Barbel steed'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 02];

%% set data
% zero-variate data
data.ab = 12;        units.ab = 'd';  label.ab = 'age at birth'; bibkey.ab = 'guess'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;   units.am = 'd';  label.am = 'life span'; bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30.5;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase'; 
data.Li = 67;    units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1 mm og Gobio gobio: pi/6*0.1^3';
data.Wwp = 283;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Based on 0.00708*Lp^3.10, see F1';
data.Wwi = 3242; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'Based on 0.00708*Li^3.10, see F1';

data.Ri = 87047/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), std length (cm)
    1 10.85 10.63
    2 18.23 17.92
    3 24.58 23.68
    4 29.36 27.84
    5 32.67 29.61
    6 37.52 NaN];
data.tL_fm(:,1) = 365 * (0.5 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(18);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'TakeKimu1991'; treat.tL_fm = {1 {'females','males'}};


%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm =  3 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tW', 'tW1'}; subtitle1 = {'Data for Zalewka creek, Utrata river'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperature in tL data is assumed to vary as T(t)=15+8*sin(2*pi*t/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00708*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Length-length: TL = SL*1.2';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3KLQ2'; % Cat of Life
metaData.links.id_ITIS = '689200'; % ITIS
metaData.links.id_EoL = '224744'; % Ency of Life
metaData.links.id_Wiki = 'Abbottina_rivularis'; % Wikipedia
metaData.links.id_ADW = 'Abbottina_rivularis'; % ADW
metaData.links.id_Taxo = '43727'; % Taxonomicon
metaData.links.id_WoRMS = '1018726'; % WoRMS
metaData.links.id_fishbase = 'Abbottina-rivularis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Abbottina_rivularis}}';  
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
bibkey = 'TakeKimu1991'; type = 'article'; bib = [ ...  
'doi = {10.2331/SUISAN.57.29}, ' ...
'author = {Takeshita, N. and S. Kimura}, ' ...
'year = {1991}, ' ...
'title = {Age and growth of the cyprinid fish \emph{Hemibarbus barbus} in the {C}hikugo river}, ' ... 
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {57(1)}, '...
'pages = {29-34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Abbottina-rivularis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
