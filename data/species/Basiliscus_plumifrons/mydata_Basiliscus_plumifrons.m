function [data, auxData, metaData, txtData, weights] = mydata_Basiliscus_plumifrons
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Corytophanidae';
metaData.species    = 'Basiliscus_plumifrons'; 
metaData.species_en = 'Plumed basilisk'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(32); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L','t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2022 12 30];

%% set data
% zero-variate data

data.ab = 67;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'Bank1983';   
  temp.ab = C2K(32); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 20*30.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(32); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'based on Basilicus basilicus';
data.am = 13*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(32); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 13.5;   units.Lb  = 'cm';  label.Lb  = 'total length at birth for male'; bibkey.Lb  = 'Bank1983';
  comment.Lb = 'SVL 4.3 cm';
data.Li  = 66.1;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'guess';  
  comment.Li = 'based on (Wwi/Wwim)^(1/3)*Lim = (193/503)^(1/3)*91';
data.Lim  = 91;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';  bibkey.Lim  = 'Wiki';  

data.Wwb = 3.2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth for male';       bibkey.Wwb = 'Bank1983';
data.Wwi = 193;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';       bibkey.Wwi = 'guess';
  comment.Wwi = 'based Wwi/Wwim ratio of Basilicus basilicus: (160/416.5)*503';
data.Wwim = 503;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';       bibkey.Wwim = 'guess';
  comment.Wwim = 'based in tL, tW and Li data: (91/45.5)^3*62.9';

data.Ri  = 3*15/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(32);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '14 to 17 eggs per clutch: 3 clutch per yr';

% univariate data
% time - length
data.tL_m = [ ... % time since birth (d),  total length (mm)
  0	135.332 135.332
 30	173.286 173.286
 60	197.430 197.430
 90	209.549 209.549
121 239.092 239.092
153 294.486 251.818
183	316.821 274.757
215 357.190 293.486
242	375.904 312.201
275	396.446 318.914
308	406.176 321.430
336	432.105 335.950
365	455.642 350.466];
data.tL_m(:,2:3) = data.tL_m(:,2:3)/ 10; % convert mm to cm
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length'};  
temp.tL_m   = C2K(32);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Bank1983'; treat.tL_m = {1, {'ind 1','ind 2'}};
comment.tL_m = 'Data for males';

% time - weight
data.tW_m = [ ... % time since birth (d),  weight (g)
  0	 3.223  3.223
 30	 4.254  4.254
 60	 6.059  6.059
 90	 5.672  5.672
121	 9.411  9.411
153	17.145 11.087
183	23.076 15.727
215	29.908 19.853
242	38.158 21.271
275	43.444 22.689
308	52.855 26.943
336	56.335 30.037
365	62.910 31.455];
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'weight'};  
temp.tW_m   = C2K(32);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Bank1983'; treat.tW_m = {1, {'ind 1','ind 2'}};
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_m = 5 * weights.tL_m;
weights.tW_m = 5 * weights.tW_m;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '5WD9W'; % Cat of Life
metaData.links.id_ITIS = '683025'; % ITIS
metaData.links.id_EoL = '795616'; % Ency of Life
metaData.links.id_Wiki = 'Basiliscus_plumifrons'; % Wikipedia
metaData.links.id_ADW = 'Basiliscus_plumifrons'; % ADW
metaData.links.id_Taxo = '49096'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Basiliscus&species=plumifrons'; % ReptileDB
metaData.links.id_AnAge = 'Basiliscus_plumifrons'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Basiliscus_plumifrons}}';
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
bibkey = 'Bank1983'; type = 'Article'; bib = [ ... 
'author = {Chris B. Banks}, ' ... 
'year = {1983}, ' ...
'title = {BREEDING AND GROWTH OF THE PLUMED BASILISK (\emph{Basiliscus plumifrons}) AT THE {R}OYAL {M}ELBOURNE {Z}OO}, ' ...
'pages = {26-30}, ' ...
'volume = {8}, ' ...
'journal = {British Herpetological Society Bulletin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Basiliscus_plumifrons}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
