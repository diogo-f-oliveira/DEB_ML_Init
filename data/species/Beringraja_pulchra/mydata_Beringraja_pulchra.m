function [data, auxData, metaData, txtData, weights] = mydata_Beringraja_pulchra

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Beringraja_pulchra'; 
metaData.species_en = 'Mottled skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 08];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 08]; 

%% set data
% zero-variate data;
data.ab = 5*30.5;units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(16.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps for all data are guessed';
data.am = 26*365; units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(16.8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 9.5;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';
  comment.Lb = '9-10 cm';
data.Lp  = 69;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase';
data.Lpm  = 47;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'fishbase';
data.Li  = 115;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';
 
data.Wwi = 14.7e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00269*Li^3.27, see F1';

data.Ri  = 240/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(16.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '98 to 556 eggs per year ';

% uni-variate data at f
LtdL = [ ... % disc width (cm), time till recapture (d), growth (cm)
    59.2   45  0.0
    52.3   35  1.6
    52.0   19  0.0
    52.8    8  0.0
    61.0   17  0.0
    62.8  103  3.6
    64.0  229  5.1
    71.0  220 11.8
    75.2  306 16.7
    45.0   56  4.0
    59.0  148  9.2
    68.0  266 11.2
    60.0  308  9.9
    70.0  312 19.2
    66.2  377 20.2
    70.2  461 22.4
    66.2  377 20.2
    70.2  461 22.4
    70.0  523 14.5
    69.0  627 28.2
    72.5  641 22.3
    68.0  251 10.5
    70.0  305 21.3
    60.0  386  9.8
    75.0 1420 38.6
    67.8  226 11.6
    59.8  282  5.4
    62.0  341 13.8
    61.0   83  7.5
    60.0   94  2.4
    62.5  220 12.2
    82.0 1317 50.0
    58.0  323 14.0
    68.0  534 26.0
    69.0  801 39.0
    64.0  500 26.0
    59.0  478 27.0
    58.0  340 30.0
    45.5   29  0.5
    54.5  271 26.5
    68.0  661 21.0
    65.0  326 24.0];
data.LL = [LtdL(:,1),  sum(LtdL(:,[1 3]),2)]/ 0.72; % cm, total length (cm), total length at recapture(cm) 
units.LL = {'cm', 'cm'};  label.LL = {'total length', 'total length at recapture'};
temp.LL = C2K(16.8);  units.temp.LL = 'K'; label.temp.LL = 'temperature';
time.LL = LtdL(:,2); units.time.LL = 'd'; label.time.LL = 'time till recapture';
treat.LL = {0}; units.treat.LL = ''; label.treat.LL = '';
bibkey.LL = 'ImJo2015';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.time = time;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length - weight: Ww in g = 0.00269 * (TL in cm)^3.27';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length - length from photo: Disc width DW = 0.72 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'LKZW'; % Cat of Life
metaData.links.id_ITIS = '564199'; % ITIS
metaData.links.id_EoL = '49672833'; % Ency of Life
metaData.links.id_Wiki = 'Beringraja_pulchra'; % Wikipedia
metaData.links.id_ADW = 'Raja_pulchra'; % ADW
metaData.links.id_Taxo = '5279564'; % Taxonomicon
metaData.links.id_WoRMS = '1015739'; % WoRMS
metaData.links.id_fishbase = 'Beringraja-pulchra'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Beringraja_pulchra}}';   
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
bibkey = 'ImJo2015'; type = 'article'; bib = [ ...  
'doi = {10.3796/KSFT.2015.51.2.227}, ' ...
'author = {Yang-Jae Im and Hyun-Su Jo}, ' ...
'year = {2015}, ' ...
'title  = {Migration and growth rate of Mottled skate, \emph{Beringraja pulchra} by the tagging release program in the {Y}ellow {S}ea, {K}orea}, ' ...
'journal = {J. Kor. Soc. Fish. Technol.}, ' ...
'volume = {51(2)}, ' ...
'pages = {227-234}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Beringraja-pulchra.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];