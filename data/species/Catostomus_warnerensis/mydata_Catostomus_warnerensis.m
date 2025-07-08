  function [data, auxData, metaData, txtData, weights] = mydata_Catostomus_warnerensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Catostomus_warnerensis'; 
metaData.species_en = 'Warner sucker'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'L-dL'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 30]; 

%% set data
% zero-variate data
data.am = 18*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17;  units.Lp = 'cm'; label.Lp = 'total length at puberty';           bibkey.Lp = 'ScheJac02011'; 
  comment.Lp = 'based on FL 16 cm';
data.Li = 47;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'Daub1980';
  comment.Li = 'fishbase gives TL 35 cm';

data.Wwb = 8.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Daub1980';
  comment.Wwb = 'based on egg diameter of 2.1 - 3  mm of Catostomus columbianus: pi/6*0.25^3';
data.Wwp = 32; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','ScheJac02011'};
  comment.Wwp = 'based on 0.00490*Lp^3.10, see F1';
data.Wwi = 748; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00490*Li^3.10, see F1';

data.Ri = 4e4/365; units.Ri = '#/d'; label.Ri = 'max reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.LdL = [ ... % fork length (cm), growth (cm/yr)
11.7	1.05036
12.0	7.63309
12.1	7.00719
16.4	4.87050
17.3	5.25899
18.3	1.50360
18.7	0.42446
18.7	1.22302
19.1	1.82734
20.6	4.87050
21.0	0.66187
23.5	1.78417
24.3	2.36691
33.5	-0.22302
38.0	0.01439
38.5	1.39568
38.5	1.35252
39.4	0.48921
42.0	0.74820];
data.LdL = data.LdL/0.94; % convert FL  to TL 
data.LdL(:,2) = data.LdL(:,2)/365; % convert TL in cm/yr to TL in cm/d
units.LdL = {'cm', 'cm/d'}; label.LdL = {'total length', 'change in total length'};  
temp.LdL = C2K(14);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'ScheJac02011';

% length - weight
data.LWw = [ ... % log10 fork length (mm), wet weight (g)
2.20498	1.61969
2.23005	1.85920
2.26587	1.91438
2.26589	1.86454
2.35003	2.23422
2.35005	2.17441
2.37079	2.21948
2.39468	2.23467
2.40595	2.37435
2.42168	2.33961
2.42290	2.43931
2.43044	2.46431
2.43172	2.41448
2.43174	2.36463
2.43800	2.42949
2.43801	2.40956
2.43802	2.38962
2.43862	2.45442
2.44869	2.42960
2.45370	2.47451
2.45373	2.41470
2.46377	2.47461
2.47002	2.55941
2.47004	2.52950
2.47067	2.50957
2.47131	2.47469
2.47695	2.53954
2.47696	2.51462
2.48448	2.57949
2.48449	2.54958
2.48450	2.53463
2.49202	2.58953
2.49704	2.61949
2.49706	2.58958
2.49706	2.56965
2.49766	2.65439
2.49834	2.52480
2.50583	2.67939
2.50584	2.64450
2.50586	2.57970
2.51147	2.70935
2.51150	2.64954
2.51843	2.61970
2.52470	2.66961
2.52531	2.70949
2.53097	2.70955
2.53287	2.66969
2.53849	2.76944
2.53851	2.71959
2.54542	2.75954
2.54797	2.66486
2.54982	2.76457
2.55043	2.80445
2.55735	2.80950
2.57432	2.83459
2.57741	2.95923
2.57996	2.89446
2.58316	2.73499
2.58503	2.78984
2.58508	2.65028
2.58623	2.91945
2.58628	2.81477
2.59004	2.83973
2.59193	2.83477
2.59446	2.79990
2.59631	2.87469
2.60070	2.91959
2.60071	2.89467
2.60258	2.93955
2.60698	2.93959
2.60700	2.90470
2.60701	2.86482
2.60702	2.83990
2.61640	2.97457
2.61642	2.93470
2.61769	2.89484
2.62709	2.97468
2.62837	2.91987
2.62903	2.85507
2.63210	3.02956
2.63715	2.98973
2.63843	2.92993
2.64217	3.01969
2.64220	2.93994
2.64282	2.96487
2.64348	2.88014
2.64718	3.07457
2.65222	3.04970];
data.LWw = 10.^data.LWw; % remove log transform
data.LWw(:,1) = data.LWw(:,1)/9.4; % convert FL in mm to TL in cm
units.LWw = {'cm', 'g'}; label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = 'ScheJac02011';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 5 * weights.LdL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00490 * (TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: FL = 0.94 cm';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'RW5L'; % Cat of Life
metaData.links.id_ITIS = '163915'; % ITIS
metaData.links.id_EoL = '207069'; % Ency of Life
metaData.links.id_Wiki = 'Catostomus_warnerensis'; % Wikipedia
metaData.links.id_ADW = 'Catostomus_warnerensis'; % ADW
metaData.links.id_Taxo = '107462'; % Taxonomicon
metaData.links.id_WoRMS = '1018044'; % WoRMS
metaData.links.id_fishbase = 'Catostomus-warnerensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Catostomus_warnerensis}}';  
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
bibkey = 'ScheJac02011'; type = 'techreport'; bib = [ ... 
'author = {Paul Scheerer and Steven Jacobs and Mark Terwilliger and Stephanie Miller and Stephanie Gunckel and Shannon Richardson1 and Michael Heck}, ' ...
'year = {2011}, ' ...
'title = {Status, Distribution, and Life History Investigations of {W}arner Suckers, 2006-2010}, ' ... 
'institution = {FISH DIVISION Oregon Department of Fish and Wildlife}, ' ...
'sereis = {INFORMATION REPORTS}, ' ...
'volume= {2011-02}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Catostomus-warnerensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Daub1980'; type = 'article'; bib = [ ... 
'doi = {10.1577/1548-8659(1980)109<92:LHOTBS>2.0.CO;2}, ' ...
'author = {Dennis D. Dauble}, ' ...
'year = {1980}, ' ...
'title = {Life History of the Bridgelip Sucker in the {C}entral {C}olumbia {R}iver}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {109(1)}, ' ...
'pages = {92-98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


