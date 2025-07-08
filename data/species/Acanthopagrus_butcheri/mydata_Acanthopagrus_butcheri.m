function [data, auxData, metaData, txtData, weights] = mydata_Acanthopagrus_butcheri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Acanthopagrus_butcheri'; 
metaData.species_en = 'Black bream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'WWp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 04];

%% set data
% zero-variate data

data.am = 29*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(17.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 60;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp = 58; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.01259*Lp^3.04, see F1';
data.Wwi = 3.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*Li^3.04, see F1';

data.Ri  = 3e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(17.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

 % univariate data
 % time-length
 data.tL_fm = [ ... % time since birth (yr), fork length (cm)
     0  9.00  9.00
     1 12.50 12.00
     2 18.94 17.78
     3 19.00 16.00
     4 19.24 18.08
     5 17.97 17.55
     6 21.27 20.13
     7 22.15 21.36
     8 23.33 22.51
     9 23.97 23.91
    10 23.00 25.00
    11 31.00 NaN
    12 30.50 25.00
    13 33.00 NaN
    14 35.00 32.00
    16 36.00 29.00
    21 NaN   32.00];    
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1) + 0.9);
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'fork length'};  
temp.tL_fm   = C2K(17.6);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MoriCout1998'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

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
F1 = 'length-weight: Ww in g = 0.01259*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8YV6'; % Cat of Life
metaData.links.id_ITIS = '647908'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Acanthopagrus_butcheri'; % Wikipedia
metaData.links.id_ADW = 'Acanthopagrus_butcheri'; % ADW
metaData.links.id_Taxo = '159912'; % Taxonomicon
metaData.links.id_WoRMS = '279071'; % WoRMS
metaData.links.id_fishbase = 'Acanthopagrus-butcheri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthopagrus_butcheri}}';
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
bibkey = 'MoriCout1998'; type = 'Article'; bib = [ ... 
'doi = {10.1071/mf97237}, ' ...
'author = {Morison, A. K. and Coutin, P. C. and Robertson, S. G.}, ' ... 
'year = {1998}, ' ...
'title = {Age determination of black bream, \emph{Acanthopagrus butcheri} ({S}paridae), from the {G}ippsland {L}akes of south-eastern {A}ustralia indicates slow growth and episodic recruitment}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {49(6)}, ' ...
'pages = {491-498}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acanthopagrus-butcheri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
