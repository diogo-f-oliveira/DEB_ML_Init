  function [data, auxData, metaData, txtData, weights] = mydata_Schizopygopsis_selincuoensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Schizopygopsis_selincuoensis'; 
metaData.species_en = 'Selincuo naked carp'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 16];

%% set data
% zero-variate data
data.tp = 8*365;      units.tp = 'd';  label.tp = 'age at puberty for females';   bibkey.tp = 'fishbase';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 7*365;      units.tpm = 'd';  label.tpm = 'age at puberty for males';  bibkey.tpm = 'fishbase';
  temp.tpm = C2K(10); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 30*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'ChenHe2002';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li = 42;    units.Li = 'cm'; label.Li = 'ultimate std length for females';   bibkey.Li = 'ChenHe2002';
data.Lim = 38;    units.Lim = 'cm'; label.Lim = 'ultimate std length for males';  bibkey.Lim = 'ChenHe2002';

data.Wwb = 2.7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: 4/3*pi*0.04^3';
data.Wwi = 1100;     units.Wwi = 'g';  label.Wwi = 'ultimate weight';             bibkey.Wwi = 'ChenHe2002';
 
data.Ri = 37.4e3/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';     bibkey.Ri = 'guess';
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Schizopygopsis_younghusbandi, corrected for Wwi: 2*18682';

% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), std length (cm), female, male
    1  3.69 NaN
    2  5.66 NaN
    3  7.97 NaN
    4 11.25 11.25
    5 13.96 14.23
    6 17.22 17.64
    7 19.26 19.72
    8 22.15 22.35
    9 24.57 24.77
   10 26.73 26.82
   11 28.28 28.20
   12 30.56 29.63
   13 31.45 30.67
   14 32.37 31.69
   15 33.68 32.55
   16 34.39 33.27
   17 35.17 33.68
   18 35.97 34.17
   19 37.05 35.07
   20 37.87 35.97
   21 38.37 36.80
   22 38.75 37.33
   23 39.02 37.80
   24 39.52 38.00
   25 39.75 NaN
   26 40.35 40.50
   27 40.75 NaN
   28 41.60 NaN
   29 42.25 NaN];
data.tL_fm (:,1) = (.5 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'std length'};  
temp.tL_fm = C2K(10);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'female', 'male'}};
bibkey.tL_fm = 'ChenHe2002';

% time-weight
data.tW_fm = [ ... % time since birth (yr), std length (cm), female, male
    1    0.7 NaN
    2    1.9 NaN
    3    4.3 NaN
    4    9.0 112.5
    5   26.4 142.3
    6   49.2 176.4
    7   91.6 197.2
    8  142.4 223.5
    9  220.4 247.7
   10  306.8 268.2
   11  352.6 282.0
   12  390.5 296.3
   13  431.8 306.7
   14  467.9 316.9
   15  495.2 325.5
   16  538.3 332.7
   17  571.9 336.8
   18  621.8 341.7
   19  678.3 350.7
   20  714.3 359.7
   21  771.2 368.0
   22  804.9 373.3
   23  851.6 378.0
   24  890.7 380.0
   25  922.4 NaN
   26  986.5 405.0
   27 1015.5 NaN
   28 1078.0 NaN
   29 1118.0 NaN];
data.tW_fm (:,1) = (.5 + data.tW_fm(:,1)) * 365; % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(10);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
treat.tW_fm = {1, {'female', 'male'}};
bibkey.tW_fm = 'ChenHe2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.tW_fm = 3 * weights.tW_fm;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Endemic species in lake Selincuo, Tibet, ';
metaData.bibkey.F1 = 'DuanXie2014'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Schizopygopsis'; % Wikipedia
metaData.links.id_ADW = 'Schizopygopsis'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = '1525493'; % WoRMS
metaData.links.id_fishbase = 'Gymnocypris-selincuoensis'; % fishbase

%% References
bibkey = 'ChenHe2002'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12439}, ' ...
'author = {Yi-Feng Chen and  De-Kui He and Yi-Yu Cnen}, ' ...
'year = {2002}, ' ...
'title = {Age discrimination of \emph{Selincua schizothoracini} (\emph{Gymnocypris selincuoensis} in {S}elincuo {L}ake, {T}ibet)}, ' ... 
'journal = {Acta Zoologica Sinica}, ' ...
'volume = {48(4)}, '...
'pages = {527-533}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gymnocypris-selincuoensis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
