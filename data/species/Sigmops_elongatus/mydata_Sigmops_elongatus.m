function [data, auxData, metaData, txtData, weights] = mydata_Sigmops_elongatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Stomiiformes'; 
metaData.family     = 'Gonostomatidae';
metaData.species    = 'Sigmops_elongatus'; 
metaData.species_en = 'Elongated bristlemouth fish'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpm'};
metaData.ecoCode.embryo  = {'Mpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.9); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 01];

%% set data
% zero-variate data
data.am = 4*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';  
  temp.am = C2K(6.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;   units.Lp = 'cm';   label.Lp = 'fork length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 27.5;   units.Li = 'cm';   label.Li = 'ultimate fork length';    bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Maurolicus_muelleri: 4/3*pi*0.04^3';
data.Wwp = 25.2; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00288*Lp^3.03, see F1';  
data.Wwi = 66.2;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00288*Li^3.03, see F1';  

data.Ri  = 5e3/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 20 cm';    bibkey.Ri  = 'guess';   
  temp.Ri = C2K(6.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.58 as found for Maurolicus_muelleri';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (month) ~ fork length (cm)
59.464	2.373
62.814	2.840
62.815	2.542
65.327	2.372
67.002	2.967
70.352	3.350
73.702	3.009
79.564	3.688
79.565	2.625
79.566	3.518
80.402	3.050
82.077	2.794
83.752	3.305
84.590	3.900
85.427	3.985
86.265	3.432
89.615	3.814
89.616	4.197
93.802	3.899
96.315	4.366
97.990	4.196
101.340	4.578
103.015	6.110
105.528	4.407
107.203	5.386
107.204	5.088
112.228	4.832
118.090	5.427
124.791	5.298
131.491	5.977
145.729	6.273
165.829	8.014
171.692	8.183
171.693	7.545
180.067	8.608
182.580	8.479
185.092	9.075
194.305	9.456
203.518	9.199
205.193	8.518
212.730	9.921
220.268	9.622
231.156	10.216
235.343	9.790
241.206	9.959
247.069	10.085
262.982	10.764
271.357	10.762
278.894	11.357
280.569	10.590
296.482	11.907
298.995	12.545
301.508	11.183
319.933	13.903
327.471	10.668
333.333	11.858
334.171	11.645
344.221	11.984
354.272	13.940
355.946	12.663
364.322	13.938
371.859	14.575
409.548	13.292
422.948	15.587
435.511	17.543
438.023	15.074
444.724	15.967
444.725	16.222
449.749	15.881
453.936	16.391
456.449	17.837
464.824	15.368
474.037	17.111
477.387	15.833]; 
data.tL(:,1) = 30.5 * (6 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(6.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LancHopk1988';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00288*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YPKW'; % Cat of Life
metaData.links.id_ITIS = '622362'; % ITIS
metaData.links.id_EoL = '213307'; % Ency of Life
metaData.links.id_Wiki = 'Sigmops_elongatus'; % Wikipedia
metaData.links.id_ADW = 'Sigmops_elongatus'; % ADW
metaData.links.id_Taxo = '3420498'; % Taxonomicon
metaData.links.id_WoRMS = '221512'; % WoRMS
metaData.links.id_fishbase = 'Sigmops-elongatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sigmops_elongatus}}';
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
bibkey = 'LancHopk1988'; type = 'article'; bib = [ ...
'author = {Thomas M. Lancraft and Thomas L. Hopkins and Joseph J. Torres}, ' ... 
'year   = {1988}, ' ...
'title  = {Aspects of the ecology of the mesopelagic fish \emph{Gonostoma elongatum} ({G}onostomatidae, {S}tomiiformes) in the eastern {G}ulf of {M}exico}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'page = {27-40}, ' ...
'volume = {49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Sigmops-elongatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

