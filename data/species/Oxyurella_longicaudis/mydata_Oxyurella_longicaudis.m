function [data, auxData, metaData, txtData, weights] = mydata_Oxyurella_longicaudis
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Chydoridae';
metaData.species    = 'Oxyurella_longicaudis'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN','TP','TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 10]; 

%% set data
% zero-variate data

data.ab = 2.30;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'CastSant2015';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.tp = 5.20;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'CastSant2015';   
  temp.tp = C2K(23);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 58;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'CastSant2015';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0504; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'CastSant2015';
data.Lp  = 0.0580; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'CastSant2015';
data.Li  = 0.0940;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'CastSant2015';

data.Wwi  = 3.8e-5;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on length 0.094 cm, height 0.0516 cm, width 0.0100 cm ; pi/4*0.094*0.0516*0.01'; 

data.Ri  = 22/(46.96-5.2);   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'CastSant2015';   
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '22 eggs per lifetime';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (mm)
0.926	0.489
1.936	0.560
2.948	0.617
3.962	0.639
5.034	0.671
5.928	0.693
7.062	0.704
8.075	0.734
8.911	0.734
9.925	0.750
10.879	0.764
11.893	0.780
12.968	0.780
13.983	0.785
14.937	0.796
16.012	0.802
16.847	0.807
17.981	0.807
18.876	0.821
19.771	0.823
21.025	0.829
21.921	0.826
22.935	0.837
23.890	0.834
24.965	0.837
25.979	0.840
27.054	0.840
27.949	0.845
28.964	0.853
29.978	0.856
30.993	0.856
32.067	0.867
32.963	0.864
33.978	0.867
34.993	0.861
36.008	0.867
36.963	0.867
37.920	0.834
38.993	0.870
39.948	0.872
40.962	0.883
42.096	0.880
43.051	0.886
44.126	0.891
45.021	0.894
46.096	0.891
46.931	0.897
47.946	0.899
49.020	0.902
50.095	0.905
51.050	0.905
52.006	0.899
53.020	0.902
54.036	0.899
54.991	0.897
56.006	0.894
57.080	0.905
57.975	0.908];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CastSant2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '4BMPV'; % Cat of Life
metaData.links.id_ITIS = '84067'; % ITIS
metaData.links.id_EoL = '339768'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Oxyurella_longicaudis'; % ADW
metaData.links.id_Taxo = '504082'; % Taxonomicon
metaData.links.id_WoRMS = '1303091'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CastSant2015'; type = 'Article'; bib = [ ... 
'doi = {10.1186/s40555-014-0104-5}, ' ...
'author = {Maria Carolina de Almeida Castilho and Maria Jos\''{e} dos Santos-Wisniewski and C\''{i}nthia Bruno de Abreu and Tereza Cristina Orlando}, ' ... 
'year = {2015}, ' ...
'title = {Life history and {DNA} barcode of \emph{Oxyurella longicaudis} ({B}irgei, 1910) ({C}ladocera, {A}nomopoda, {C}hydoridae)}, ' ...
'journal = {Zoological Studies}, ' ...
'volume = {54}, ' ...
'pages = {20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
