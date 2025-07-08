  function [data, auxData, metaData, txtData, weights] = mydata_Ictiobus_cyprinellus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Ictiobus_cyprinellus'; 
metaData.species_en = 'Bigmouth buffalo'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 03]; 

%% set data
% zero-variate data
data.am = 26*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 55;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'John1959'; 
  comment.Lp = 'based on tp 5 yr, and tL data';
data.Li = 123;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'John1959';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwi = 24.12e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.03, see F1';

data.Ri = 750322/365;   units.Ri = '#/d';  label.Ri = 'max Reprod rate';    bibkey.Ri = 'fishbase';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % year class (yr), fork length (inch)
1.000	12.696
2.000	14.695
3.000	15.937
4.000	17.361
4.975	19.722
6.000	22.507
7.050	25.231];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2) * 2.54/ 0.9; % convert FL in inch to TL in cm
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'John1959';

% length - weight
data.LWw = [ ... fork length (inch), wet weight (pound)
10.562	0.750
10.909	0.750
11.355	1.050
11.752	1.300
11.752	1.350
11.802	1.150
12.050	1.300
12.198	1.400
12.397	1.400
12.645	1.600
12.843	1.600
12.992	1.700
13.240	1.850
13.240	1.750
13.785	1.950
13.934	1.900
14.083	2.000
14.231	2.100
14.430	2.250
14.777	2.550
14.777	2.250
14.826	2.350
14.975	2.500
15.124	2.650
15.124	2.650
15.372	2.700
15.471	2.600
15.818	3.050
16.909	3.600
17.405	4.200
17.653	4.550
18.000	4.350
18.893	4.900
19.388	5.700
19.736	5.300
19.884	5.650
20.430	6.300
20.529	6.100
20.579	6.300
20.579	5.700
20.678	5.950
20.876	5.900
21.025	6.550
21.174	6.950
21.471	7.400
21.570	6.850
21.669	7.650
21.719	7.400
21.967	7.650
22.314	8.350
22.364	7.650
22.413	7.150
22.661	7.150
22.760	8.300
22.760	7.650
23.058	9.250
23.504	8.950
23.653	8.200
23.752	9.000
24.050	10.500
24.248	10.900
24.446	9.750
24.744	12.250
24.893	12.050
25.041	10.400
25.438	13.150
25.686	12.800
25.835	14.150
25.835	13.700
25.934	11.600
26.380	13.100
26.678	12.600
26.727	13.450
26.876	14.850
26.876	13.350
28.314	14.550
28.413	16.850
28.711	16.450
29.008	18.050
29.355	17.150
31.091	25.550];
data.LWw(:,1) = data.LWw(:,1) * 2.54/ 0.9; % convert FL in inch to TL in cm
data.LWw(:,2) = data.LWw(:,2) * 453.60; % convert pound to g
units.LWw = {'cm', 'g'}; label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = 'John1959';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

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
F1 = 'length-weight: Ww in g = 0.01122 * (TL in cm)^3.03'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: FL =0.9 * TL'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3PBC6'; % Cat of Life
metaData.links.id_ITIS = '163956'; % ITIS
metaData.links.id_EoL = '216707'; % Ency of Life
metaData.links.id_Wiki = 'Ictiobus_cyprinellus'; % Wikipedia
metaData.links.id_ADW = 'Ictiobus_cyprinellus'; % ADW
metaData.links.id_Taxo = '177458'; % Taxonomicon
metaData.links.id_WoRMS = '1044802'; % WoRMS
metaData.links.id_fishbase = 'Ictiobus-cyprinellus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ictiobus_cyprinellus}}';  
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
bibkey = 'John1959'; type = 'phdthesis'; bib = [ ...  
'author = {Ronald Phillip Johnson}, ' ...
'year = {1959}, ' ...
'title = {Life history of the bigmouth buffalofish \emph{Ictiobus cyprinellus} in {S}askatchewan}, ' ... 
'school = {Dept biol. Univ. Saskatchewan}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ictiobus-cyprinellus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

