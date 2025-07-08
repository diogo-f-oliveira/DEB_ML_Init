function [data, auxData, metaData, txtData, weights] = mydata_Tetronarce_nobiliana
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Torpediniformes'; 
metaData.family     = 'Torpedinidae';
metaData.species    = 'Tetronarce_nobiliana'; 
metaData.species_en = 'Atlantic torpedo'; 

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0pMd','piMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.2); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 19];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 19]; 

%% set data
% zero-variate data;
data.ab = 1*365; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'FranMaol2018';   
  temp.ab = C2K(13.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'FranMaol2018';   
  temp.am = C2K(13.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 23;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'fishbase';
  comment.Lb = '9-10 cm';
data.Lp = 62;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'FranMaol2018';
data.Lpm = 52; units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'FranMaol2018';
  comment.Lpm = 'possibly 60 cm';
data.Li  = 180;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwi  = 86.2e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.01820*Li^2.96, see F3';

data.Ri  = 60/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(13.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), pelvic length (cm)
0.000	17.586
3.013	54.593
4.017	78.891
4.043	64.635
6.000	83.761
7.468	104.284
8.472	94.601
9.502	110.345
9.966	104.670];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2)/0.73; % convert PL to TL
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'pelviv length', 'female'};  
temp.tL_f = C2K(13.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FranMaol2018';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), pelvic length (mm)
0.000	17.586
2.472	49.809
3.013	61.960
3.966	58.452
5.485	73.988];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2)/0.73; % convert PL to TL
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'pelvic length', 'male'};  
temp.tL_m = C2K(13.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FranMaol2018';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

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
D1 = 'males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'ovoviviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'demersal as juvenile, pelagic as adult; depth range 0 - 400 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.01820 * (TL in cm)^2.96';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'length-length: pelvic length PL = 0.73 * TL';
metaData.bibkey.F4 = 'FranMaol2018'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '7BSJ6'; % Cat of Life
metaData.links.id_ITIS = '160834'; % ITIS
metaData.links.id_EoL = '46560372'; % Ency of Life
metaData.links.id_Wiki = 'Tetronarce_nobiliana'; % Wikipedia
metaData.links.id_ADW = 'Tetronarce_nobiliana'; % ADW
metaData.links.id_Taxo = '609760'; % Taxonomicon
metaData.links.id_WoRMS = '321911'; % WoRMS
metaData.links.id_fishbase = 'Tetronarce-nobiliana'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tetronarce_nobiliana}}';  
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
bibkey = 'FranMaol2018'; type = 'techreport'; bib = [ ... 
'isbn = {ISBN 978-1-77665-767-4}, ' ...
'author = {M. P . Francis and C. \''{O}. Maolag\''{a}in and W. S. Lyon}, ' ...
'year = {2018}, ' ...
'title  = {Growth and reproduction of carpet shark, common electric ray and blind electric ray in {N}ew {Z}ealand waters}, ' ...
'series = {New Zealand Aquatic Environment and Biodiversity}, ' ...
'volume = {195}, ' ...
'institution = {Ministry for Primary Industries, PO Box 2526, WELLINGTON 6140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Tetronarce-nobiliana.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

