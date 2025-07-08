function [data, auxData, metaData, txtData, weights] = mydata_Eopsetta_grigorjewi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Eopsetta_grigorjewi'; 
metaData.species_en = 'Shotted halibut'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.8); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 16];

%% set data
% zero-variate data
data.ab = 14;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'fishbase';    
  temp.ab = C2K(8.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';  
  temp.am = C2K(8.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19.5;  units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'DagaChan1992';
data.Li = 60;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 1.1e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwp = 66.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00708*Lp^3.08, see F1';
data.Wwi = 2.1e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';

% uni-variate data
% time-length
data.tL_fm = [ ... % age (years) ~ Length (cm) 
 2	15.683 15.579
 3	20.918 20.290
 4	25.938 23.856
 5	28.779 26.589
 6  32.038 26.828
 7  33.939 NaN];
data.tL_fm(:,1) = 365 * (0+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(8.8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'DagaChan1992'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % age (years) ~ weight (g0
 2	NaN      26.712
 3	156.164 125.342
 4	275.342 191.096
 5	384.247 269.178
 6  493.151 310.274
 7  575.342 NaN];
data.tW_fm(:,1) = 365 * (0+data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(8.8);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'DagaChan1992'; treat.tW_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
19.623	183514.253
20.189	168868.067
21.057	201910.497
21.774	259858.681
21.811	227382.113
21.811	212382.158
21.811	174882.189
22.453	215283.173
22.491	240306.681
22.906	255566.066
22.906	198066.157
22.943	243089.772
23.019	298136.942
23.547	235967.064
23.547	273467.034
23.547	335967.095
24.000	203750.093
24.113	298820.894
24.113	246320.802
24.151	276344.463
24.226	373891.588
24.491	306556.634
24.528	269080.248
24.868	279292.478
24.906	336816.140
24.943	264339.694
24.981	306863.233
25.547	252217.001
25.623	277264.261
25.660	317287.892
25.660	342287.816
25.698	402311.386
25.736	372334.894
25.736	494834.941
26.189	350118.062
26.189	325117.970
26.226	292641.569
26.528	387830.292
26.642	365401.031
27.057	400660.355
27.132	353207.584
27.170	288231.199
27.208	480754.785
27.698	411061.429
27.774	361108.583
28.038	318773.720
28.038	368773.568
28.038	403773.630
28.038	433773.706
28.113	456320.723
28.113	486320.799
28.566	476603.845
28.642	396650.921
28.642	331650.951
28.679	549174.630
28.717	451698.092
28.830	431768.906
29.358	437099.075
29.434	509646.275
30.113	370070.720
30.113	345070.796
30.151	415094.335
30.226	485141.459
30.264	655165.198
30.340	565212.305
30.340	515212.289
30.943	560589.674
31.962	683726.420
33.358	687099.042];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(8.8);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'DagaChan1992'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tW_fm;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;
weights.Lp = 3 * weights.Lp;
weights.ab = 0 * weights.ab;

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
D1 = 'males are assumed to differ from females by {p_Am} only ';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6FL95'; % Cat of Life
metaData.links.id_ITIS = '172869'; % ITIS
metaData.links.id_EoL = '13171'; % Ency of Life
metaData.links.id_Wiki = 'Eopsetta_grigorjewi'; % Wikipedia
metaData.links.id_ADW = 'Eopsetta_grigorjewi'; % ADW
metaData.links.id_Taxo = '173832'; % Taxonomicon
metaData.links.id_WoRMS = '280689'; % WoRMS
metaData.links.id_fishbase = 'Eopsetta-grigorjewi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eopsetta_grigorjewi}}';
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
bibkey = 'DagaChan1992'; type = 'article'; bib = [ ...
'author = {Chen Dagang and Liu Changan and Dou Shuozeng}, ' ...
'year   = {1992}, ' ...
'title  = {THE BIOLOGY OF FLATFISH ({P}LEURONECTINAE) IN THE COASTAL WATERS OF {C}HINA}, ' ... 
'journal = {Netherlands Journal of Sea Research}, ' ...
'page = {215-221}, ' ...
'volume = {29(1-3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Eopsetta-grigorjewi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
