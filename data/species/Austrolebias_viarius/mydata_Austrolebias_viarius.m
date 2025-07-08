  function [data, auxData, metaData, txtData, weights] = mydata_Austrolebias_viarius
  %% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Rivulidae';
metaData.species    = 'Austrolebias_viarius'; 
metaData.species_en = 'Killifish'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Ni'};  
metaData.data_1     = {'t-L_Tf'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 03];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU Univ. Amsterdam'};      

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc    = [2020 10 03]; 

%% set data
% zero-variate data
data.tp = 75;        units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'ErreDanu2001';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 200;        units.am = 'd';  label.am = 'life span';  bibkey.am = 'ErreDanu2001';
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.565;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'ErreDanu2001';  
data.Lp = 3.5;     units.Lp = 'cm';     label.Lp = 'total length at puberty';  bibkey.Lp = 'ErreDanu2001';
data.Li = 6.8;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'ErreDanu2001';

data.Wwb  = 1.08e-3;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';    bibkey.Wwb  = 'ErreDanu2001';  
data.Wwi  = 2;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'ErreDanu2001';
  comment.Wwi = 'based on  0.0029*Li^3.4123, see F2'; 

data.Ni = 150;  units.Ni = '#'; label.Ni = 'cum # eggs till 200 d';   bibkey.Ni = 'guess';
  temp.Ni = C2K(25); units.temp.Ni = 'K'; label.temp.Ni = 'temperature'; 

% uni-variate data
  
% time-length
data.tL_fld = [ ... % time  (d), CL length (cm)
0.000	0.986
15.977	2.049
29.938	2.425
47.932	2.374
61.427	2.536
76.939	2.501
105.791	3.425
118.046	3.568
150.000	3.962];
units.tL_fld = {'d', 'cm'}; label.tL_fld = {'time', 'total length', 'var T, filed'};  
temp.tL_fld = [ ... % time (d) temp (C)
 0.000	21.950
15.417	15.285
29.684	15.962
47.708	10.977
60.574	12.510
76.732	8.381
105.859	14.074
117.454	20.330
150.000	23.711];
units.temp.tL_fld = 'K'; label.temp.tL_fld = 'temperature';
bibkey.tL_fld = 'ErreDanu2001';
comment.tL_fld = 'Data for field conditions';
%
data.tL_15 = [ ... % time  (d), total length (cm)
0.00	1.800
16.943	2.059
31.069	2.491
46.473	3.196
61.130	3.863
75.264	4.342
90.105	4.623
103.709	4.886
118.293	5.101
137.051	5.212
157.564	5.502];
units.tL_15 = {'d', 'cm'}; label.tL_15 = {'time', 'total length', '15 C lab'};  
temp.tL_15 = C2K(15);  units.temp.tL_15 = 'K'; label.temp.tL_15 = 'temperature';
bibkey.tL_15 = 'ErreDanu2001';
comment.tL_15 = 'Data for lab conditions at 15 C; origin is at 30 d post-hatch';
%
data.tL_25 = [ ... % time (d), total length (cm)
0.00	1.800
17.215	2.210
32.105	2.793
46.322	3.780
60.500	4.532
76.115	5.020
89.715	5.254
104.339	5.714
118.252	6.353
137.272	6.559];
units.tL_25 = {'d', 'cm'}; label.tL_25 = {'time', 'total length', '25 C lab'};  
temp.tL_25 = C2K(25);  units.temp.tL_25 = 'K'; label.temp.tL_25 = 'temperature';
bibkey.tL_25 = 'ErreDanu2001';
comment.tL_25 = 'Data for lab conditions at 25 C; origin is at 30 d post-hatch';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_25', 'tL_15', 'tL_fld'}; subtitle1 = {'Data for 25,15 C in lab and in field'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Anual killifish'; 
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: log W = log 0.0029 + 3.4123 log TL'; 
metaData.bibkey.F2 = 'ErreDanu2001';
F3 = 'length length relationship from photo: SL = 0.81 * TL'; 
metaData.bibkey.F3 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = 'JWWY'; % Cat of Life
metaData.links.id_ITIS = '647176'; % ITIS
metaData.links.id_EoL = '356178'; % Ency of Life
metaData.links.id_Wiki = 'Austrolebias'; % Wikipedia
metaData.links.id_ADW = 'Austrolebias_viarius'; % ADW
metaData.links.id_Taxo = '162739'; % Taxonomicon
metaData.links.id_WoRMS = '1013484'; % WoRMS
metaData.links.id_fishbase = 'Austrolebias-viarius'; % fishbase


%% References
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Austrolebias-viarius.html}}';
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
bibkey = 'ErreDanu2001'; type = 'Article'; bib = [ ...
'author = {Adriana Erreaa and Eva Danulatb}, ' ...
'year = {2001}, ' ...
'title = {Growth of the annual fish, \emph{Cynolebias viarius} ({C}yprinodontiformes), in the natural habitat compared to laboratory conditions}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {61}, ' ...
'pages = {261-268}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

