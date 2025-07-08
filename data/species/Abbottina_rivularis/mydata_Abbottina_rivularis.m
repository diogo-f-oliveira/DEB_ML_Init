  function [data, auxData, metaData, txtData, weights] = mydata_Abbottina_rivularis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Abbottina_rivularis'; 
metaData.species_en = 'Chinese false gudgeon'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 27];

%% set data
% zero-variate data
data.ab = 15;        units.ab = 'd';  label.ab = 'age at birth'; bibkey.ab = 'guess'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365;   units.am = 'd';  label.am = 'life span'; bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.5;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase'; 
data.Li = 18.9;    units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1 mm og Gobio gobio: pi/6*0.1^3';
data.Wwp = 0.87;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'Based on 0.00776*Lp^3.14, see F1';
data.Wwi = 79; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Based on 0.00776*Li^3.14, see F1';

data.Ri = 1711*2/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1711 eggs per nest, 2 nests per yr assumed';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
0.051	1.483
0.064	1.947
0.141	2.477
0.145	2.132
0.211	3.086
0.240	2.768
0.285	3.722
0.295	3.483
0.410	4.437
0.412	3.815
0.465	3.815
0.482	4.384
0.561	4.106
0.570	4.291
0.643	4.172
0.734	4.371
0.744	3.974
0.805	4.596
0.809	3.854
0.877	4.464
0.908	3.947
0.971	4.768
0.986	4.411
1.049	4.861
1.068	4.583
1.143	4.570
1.152	5.033
1.238	5.404
1.283	5.695];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
data.tL(:,2) = data.tL(:,2) * 1.2; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HayaKim2013';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tW', 'tW1'}; subtitle1 = {'Data for Zalewka creek, Utrata river'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperature in tL data is assumed to vary as T(t)=15+8*sin(2*pi*t/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00776*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Length-length: TL = SL*1.2';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '63YRW'; % Cat of Life
metaData.links.id_ITIS = '639367'; % ITIS
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
bibkey = 'HayaKim2013'; type = 'article'; bib = [ ...  
'doi = {10.1007/s10228-013-0335-1}, ' ...
'author = {Kosuke Hayashi and Eun Jin Kim and Norio Onikura}, ' ...
'year = {2013}, ' ...
'title = {Growth and habitat use of the {C}hinese false gudgeon, \emph{Abbottina rivularis}, in an irrigation channel near the {U}shizu {R}iver, northern {K}yushu {I}sland, {J}apan}, ' ... 
'journal = {Ichthyol. Res.}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {60(3)}, '...
'pages = {218–226}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Abbottina-rivularis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
