function [data, auxData, metaData, txtData, weights] = mydata_Pomatoschistus_norvegicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Pomatoschistus_norvegicus'; 
metaData.species_en = 'Norway goby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.6); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 26];

%% set data
% zero-variate data

data.ab = 10.5;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(8.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(8.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 3.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'GibsEzzi1981'; 
data.Li  = 8;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 2.771e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 1.08 mm, width 0.7 mm of Pomatoschistus_minutus: pi/6*0.108*0.07^2';
data.Wwp = 0.35;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','GibsEzzi1981'};
  comment.Wwp = 'based on 0.00724*Lp^3.03, see F1';
data.Wwi = 3.95;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00724*Li^3.03, see F1';

% uni-variate data
% time-length
data.tL_f = [... %  yr class (yr), std length (cm)
230.300	2.940
249.462	2.863
266.888	3.077
286.209	3.250
320.093	3.664
347.085	3.815
378.950	4.077
410.740	4.222
440.622	4.387
470.597	4.698
501.201	4.490
533.978	4.676
559.841	4.565
594.481	4.661
615.577	4.605
631.866	4.543
654.011	4.625
684.739	4.611
711.620	4.590];
data.tL_f(:,1) = 0+data.tL_f(:,1); 
data.tL_f(:,2) = data.tL_f(:,2)*1.2; % convert SL to TL see F2
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f   = C2K(8.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GibsEzzi1981'; 
%
data.tL_m = [... %  yr class (yr), std length (cm)
228.503	3.133
248.479	2.829
266.052	3.271
288.321	3.547
317.273	3.761
351.878	3.802
379.963	4.160
407.955	4.374
439.714	4.470
473.430	4.622
502.219	4.580
530.291	4.918
560.876	4.682
589.772	4.806
615.679	4.764
628.245	4.888
654.082	4.736
683.933	4.853
711.562	4.500];
data.tL_m(:,1) = 0 + data.tL_m(:,1); 
data.tL_m(:,2) = data.tL_m(:,2)*1.2; % convert SL to TL see F2
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m   = C2K(8.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GibsEzzi1981'; 

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
3.609	1177.049
3.713	1216.394
3.800	1919.672
3.800	1521.312
3.803	2204.918
3.805	2386.885
4.011	1895.082
4.104	1885.246
4.199	2372.131
4.202	2263.934
4.203	1895.082
4.408	1752.459
4.597	1865.574
4.599	2529.508
4.609	2932.787
4.702	2032.787
5.105	2391.803
5.413	3891.803
5.416	2859.016
5.514	2883.607];
data.LN(:,1) = data.LN(:,1)*1.2; % convert SL to TL see F2
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN   = C2K(8.6);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'GibsEzzi1981'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Weight-length: Ww in g = 0.00724*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase';
F2 = 'TL = 1.2 * SL';
metaData.bibkey.F2 = 'GibsEzzi1981';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4LQXM'; % Cat of Life
metaData.links.id_ITIS = '171983'; % ITIS
metaData.links.id_EoL = '46575292'; % Ency of Life
metaData.links.id_Wiki = 'Pomatoschistus_norvegicus'; % Wikipedia
metaData.links.id_ADW = 'Pomatoschistus_norvegicus'; % ADW
metaData.links.id_Taxo = '184519'; % Taxonomicon
metaData.links.id_WoRMS = '126929'; % WoRMS
metaData.links.id_fishbase = 'Pomatoschistus-norvegicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomatoschistus_norvegicus}}';
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
bibkey = 'GibsEzzi1981'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1981.tb03836.x}, ' ...
'author = {R. N. Gibson and I. A. Ezzi}, ' ... 
'year = {1981}, ' ...
'title = {The biology of the {N}orway goby, \emph{Pomatoschistus norvegicus} ({C}ollett), on the west coast of {S}cotland}, ' ...
'journal = {Journal of Fish Biology }, ' ...
'volume = {19(6)}, ' ...
'pages = {697–714}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Pomatoschistus-norvegicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

