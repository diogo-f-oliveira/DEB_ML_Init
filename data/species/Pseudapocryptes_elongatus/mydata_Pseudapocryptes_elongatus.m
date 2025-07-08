function [data, auxData, metaData, txtData, weights] = mydata_Pseudapocryptes_elongatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Oxudercidae';
metaData.species    = 'Pseudapocryptes_elongatus'; 
metaData.species_en = 'Mudskipper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MI'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 24];

%% set data
% zero-variate data

data.ab = 5;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'DinhAmba2007';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 12.4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'fishbase'; 
data.Li  = 20;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 2.1e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.1 mm and width of 0.6 mm: pi/6*0.11*0.06^2';
data.Wwp = 11.6;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00724*Lp^2.93, see F1';
data.Wwi = 47;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for males';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00724*Li^2.93, see F1';


% uni-variate data
% time-length
data.tL = [... %  time (d), total length (cm)
132.562	10.760
160.406	11.489
193.093	11.564
223.964	13.519
254.834	14.739
284.494	13.669
315.970	15.788
365+13.317	16.428
365+46.609	16.748
365+72.032	17.641
365+104.718	17.879
365+133.773	18.772
365+162.828	18.602
365+194.909	18.595
365+254.229	19.399
365+286.310	19.474
365+315.365	20.530
365+345.630	20.850
365+377.711	21.416
365+440.058	21.402
365+468.507	21.477
365+499.378	21.879
365+531.459	22.689];
data.tL(:,1) = data.tL(:,1) + 190; % set origin at birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DinhAmba2007';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
12.779	3449.881
13.312	4289.044
14.864	8298.367
14.952	11282.049
15.825	8764.565
16.667	7738.925
16.786	19766.897
16.786	15104.893
16.874	13519.812
16.874	9976.688
17.052	8578.086
17.111	11468.528
17.126	15384.612
17.126	5874.123
17.214	19673.657
17.288	8857.806
17.347	14638.692
17.407	16410.254
17.628	17902.095
17.673	9603.728
17.954	15291.372
17.998	12960.371
18.205	11655.010
18.308	23962.701
18.338	13706.291
18.367	14265.732
18.397	18368.295
18.397	21072.259
18.589	22564.101
18.678	14825.174
18.855	18368.295
18.885	12960.371
19.003	13799.532
19.358	17622.375
19.432	23030.302
19.698	22470.861
19.742	16503.495
20.363	22097.901
20.437	29370.628
20.541	26480.184
20.836	24242.422
20.881	25174.823
21.516	30023.308
22.270	30862.469
23.143	30675.989];
units.LN  = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN   = C2K(26);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'DinhAmba2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Weight-length: Ww in g = 0.00724*(TL in cm)^2.93';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4NL64'; % Cat of Life
metaData.links.id_ITIS = '637913'; % ITIS
metaData.links.id_EoL = '46576729'; % Ency of Life
metaData.links.id_Wiki = 'Pseudapocryptes'; % Wikipedia
metaData.links.id_ADW = 'Pseudapocryptes_elongatus'; % ADW
metaData.links.id_Taxo = '184998'; % Taxonomicon
metaData.links.id_WoRMS = '282403'; % WoRMS
metaData.links.id_fishbase = 'Pseudapocryptes-elongatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudapocryptes}}';
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
bibkey = 'DinhAmba2007'; type = 'Article'; bib = [ ... 
'author = {Dinh, T.D. and M.A. Ambak and A. Hassan and N.T. Phuong}, ' ... 
'year = {2007}, ' ...
'title = {Biology and Population biology of the goby \emph{Pseudapocryptes elongatus} in the coastal mud flat areas of the {M}ekong {D}elta, {V}ietnam}, ' ...
'journal = {Pak. J. Biol. Sci.}, ' ...
'volume = {10(19)}, ' ...
'pages = {3284-3294}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Pseudapocryptes-elongatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

