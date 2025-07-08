  function [data, auxData, metaData, txtData, weights] = mydata_Rutilus_rutilus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Rutilus_rutilus'; 
metaData.species_en = 'Common roach'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiHl', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 13]; 

%% set data
% zero-variate data
data.ab = 5;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'Laak2010'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 4 d';
data.tp = 3*365;      units.tp = 'd';  label.tp = 'age at puberty for females';         bibkey.tp = 'Laak2010';
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;     units.tpm = 'd';  label.tpm = 'age at puberty for males';         bibkey.tpm = 'Laak2010';
  temp.tpm = C2K(18); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 14*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'Laak2010';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 12.1;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'Laak2010'; 
  comment.Lp = 'Computed from fork length 10.7 cm: (FL + 0.21208)/ 0.9023';
data.Lpm = 9.3;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'Laak2010'; 
  comment.Lp = 'Computed from fork length 8.2 cm: (FL + 0.21208)/ 0.9023';
data.Li = 44;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'Laak2010';

data.Wwb = 9e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Laak2010';
  comment.Wwb = 'Based on egg diameter of 1.2 mm: 4/3*pi*0.06^3';
data.Wwp = 17.1;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'Laak2010';
  comment.Wwp = 'Based on 0.00387*Lp^3.366';
data.Wwpm = 7.0;  units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males';    bibkey.Wwpm = 'Laak2010';
  comment.Wwpm = 'Based on 0.00387*Lp^3.366';
data.Wwi = 1.435e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Laak2010';

data.R14 = 5.2e3/365;   units.R14 = 'g';  label.R14 = 'Reprod rate at TL 14 cm';    bibkey.R14 = 'Laak2010';
  temp.R14 = C2K(18); units.temp.R14 = 'K'; label.temp.R14 = 'temperature';
data.R22 = 30e3/365;   units.R22 = 'g';  label.R22 = 'Reprod rate at TL 22 cm';    bibkey.R22 = 'Laak2010';
  temp.R22 = C2K(18); units.temp.R22 = 'K'; label.temp.R22 = 'temperature';

% univariate data

% time-length
data.tL1 = [ ... % time since birth (yr), total length (cm)
 5 15.7
 6 16.5
 7 17.2
 8 18.1
 9 19.6
10 20.0
11 23.5
12 24.3
13 28.1
14 28.3];
data.tL1(:,1) = 365 * data.tL1(:,1);
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'total length', 'Sierakowo Lake'};  
temp.tL1 = C2K(18);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'RaczCzer2008';
comment.tL1 = 'Sierakowo Lake';
% 
data.tL2 = [ ... % time since birth (yr), total length (cm)
 4 12.0
 5 13.0
 6 14.3
 7 15.0
 8 16.4
 9 18.0
10 21.0
11 22.0];
data.tL2(:,1) = 365 * data.tL2(:,1);
units.tL2 = {'d', 'cm'}; label.tL2 = {'time since birth', 'total length', 'Blotno Lake'};  
temp.tL2 = C2K(18);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'RaczCzer2008';
comment.tL2 = 'Blotno Lake';
% 
data.tL3 = [ ... % time since birth (yr), total length (cm)
 7 23.4
 8 24.3
 9 24.0
10 26.3];
data.tL3(:,1) = 365 * data.tL3(:,1);
units.tL3 = {'d', 'cm'}; label.tL3 = {'time since birth', 'total length', 'Wickie Lake'};  
temp.tL3 = C2K(18);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'RaczCzer2008';
comment.tL3 = 'Wickie Lake';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 10;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1', 'tL2', 'tL3'}; subtitle1 = {'Data for Sierakowo, Blotno, Wickie Lake'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00387*(TL in cm)^3.366';
metaData.bibkey.F1 = 'Laak2010'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4TTHT'; % Cat of Life
metaData.links.id_ITIS = '202269'; % ITIS
metaData.links.id_EoL = '46581656'; % Ency of Life
metaData.links.id_Wiki = 'Rutilus_rutilus'; % Wikipedia
metaData.links.id_ADW = 'Rutilus_rutilus'; % ADW
metaData.links.id_Taxo = '43677'; % Taxonomicon
metaData.links.id_WoRMS = '154333'; % WoRMS
metaData.links.id_fishbase = 'Rutilus-rutilus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rutilus_rutilus}}';  
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
bibkey = 'Laak2010'; type = 'Techreport'; bib = [ ...  
'author = {G. A. J. de Laak}, ' ...
'year = {2010}, ' ...
'title = {Kennisdocument blankvoorn \emph{Rutilus rutilus} ({L}innaeus, 1758)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {32}, '...
'howpublished = {\verb+\url{http://www.sportvisserijnederland.nl/files/kennisdoc-blankvoorn2_6102.pdf}+}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RaczCzer2008'; type = 'Article'; bib = [ ...  
'author = {M. Raczynski and P. Czerniejewski and M. Witkowska and B. Kiriaka}, ' ...
'year = {2008}, ' ...
'title = {AGE  AND  GROWTH  RATE  OF  ROACH (\emph{Rutilus rutilus} {L}.)  FROM  3  LAKES  USED FOR  RECREATIONAL  FISHING}, ' ... 
'journal = {Teka Kom. Ochr. Kszt. \''{S}rod. Przyr.}, ' ...
'volume = {5A}, '...
'pages = {106--116}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

