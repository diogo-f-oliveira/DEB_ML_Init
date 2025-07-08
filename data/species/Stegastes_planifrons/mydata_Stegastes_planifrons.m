function [data, auxData, metaData, txtData, weights] = mydata_Stegastes_planifrons

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Stegastes_planifrons'; 
metaData.species_en = 'Threespot damselfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 22];

%% set data
% zero-variate data

data.ab = 6;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(27.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 19*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'SchwFerr2002';   
  temp.am = C2K(27.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 13;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 5.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.02138*Lp^2.96, see F1';
data.Wwi = 32;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02138*Li^2.96, see F1';

data.Ri  = 125; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chromis chromis';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), standard length (cm)
0.881	3.991
0.930	4.859
0.944	6.854
1.062	5.760
1.914	6.341
1.997	6.888
2.000	4.668
3.066	7.501
3.919	7.728
3.937	7.052
5.022	8.180
5.106	7.633
5.924	8.664
5.975	8.149
6.928	8.826
7.045	8.215
7.047	7.218
7.897	8.828
8.032	8.345
9.084	9.473
9.118	9.055
9.987	9.153
10.072	8.638
10.957	9.251
11.075	8.543
11.993	9.799
12.929	10.091
12.980	9.576
12.981	9.125
13.950	9.384
14.033	9.931
16.057	9.549
16.976	10.161
17.094	9.422];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length', 'Galapagos'};  
bibkey.tL = 'SchwFerr2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02138*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4ZNNN'; % Cat of Life
metaData.links.id_ITIS = '615485'; % ITIS
metaData.links.id_EoL = '46572343'; % Ency of Life
metaData.links.id_Wiki = 'Stegastes_planifrons'; % Wikipedia
metaData.links.id_ADW = 'Stegastes_planifrons'; % ADW
metaData.links.id_Taxo = '188087'; % Taxonomicon
metaData.links.id_WoRMS = '276679'; % WoRMS
metaData.links.id_fishbase = 'Stegastes-planifrons'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stegastes_planifrons}}';
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
bibkey = 'CaldWell2003'; type = 'Article'; bib = [ ... 
'doi = {10.2307/24867536}, ' ...
'author = {Chris Caldow and Gerard M. Wellington}, ' ... 
'year = {2003}, ' ...
'title = {Patterns of annual increment formation in otoliths of pomacentrids in the tropical western {A}tlantic: implications for population age-structure examination}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {265}, ' ...
'pages = {185–195'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Stegastes-planifrons.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
