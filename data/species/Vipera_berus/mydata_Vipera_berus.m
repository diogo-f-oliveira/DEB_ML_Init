function [data, auxData, metaData, txtData, weights] = mydata_Vipera_berus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Viperidae';
metaData.species    = 'Vipera_berus'; 
metaData.species_en = 'Common European adder'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'BWk', 'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iThh', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 08];

%% set data
% zero-variate data

data.ap = 3.5*365;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'arkive';
  temp.ap = C2K(18); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 20*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'StumStri2006';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 17;    units.Lb  = 'cm';  label.Lb  = 'total length at hatching';      bibkey.Lb  = 'From1969';  
data.Li  = 70;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'StumStri2006';
  comment.Li = 'Rarely 90 cm';

data.Wwi = 180;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '50 - 180 g';
  
data.Ri  = 20/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'EngeFrit1993';   
  temp.Ri = C2K(18);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 till 20 each other year. From1969: mostly 10 till 14';

% univariate data
% t-L data 
data.tL = [ ... % time since birth (month), total (cm)
0 16
3 18
12 26
24 35
36 43
60 47];
data.tL(:,1) = 30.5 * data.tL(:,1); % convert month to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'From1969';
comment.tL = 'Temp is guessed';

% t-L data high food
data.tL1 = [ ... % time since birth (d), SVL (cm)
0 16.475
0 17.981
0 17.983
0 17.985
0 18.014
0 18.536
0 18.566
0 19.011
0 19.015
28 18.951
28 19.463
28 19.463
28 19.976
28 20.415
28 20.890
28 20.890
28 21.439
28 21.915
28 22.463
63 22.497
63 23.004
63 23.440
63 23.982
63 24.515
63 25.427
63 25.429
63 25.437
63 26.432
98 26.002
98 26.002
98 27.469
98 27.469
98 28.056
98 28.056
98 28.056
98 29.083
98 30.037];
units.tL1  = {'d', 'cm'};  label.tL1 = {'time since birth', 'SVL', 'high food'};  
temp.tL1   = C2K(28);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'ForsLind1996';
% low food
data.tL0 = [ ... % time since birth (d), SVL (cm)
0 16.954
0 17.503
0 17.981
0 18.527
0 18.537
0 19.494
28 18.951
28 18.951
28 19.537
28 19.976
28 20.415
28 20.415
28 20.451
28 20.927
63 20.520
63 21.051
63 21.497
63 21.502
63 21.528
63 21.989
63 22.431
63 27.479
98 21.491
98 21.968
98 22.445
98 23.949
98 23.985
98 24.059
98 24.425
98 26.002
98 27.983];
units.tL0  = {'d', 'cm'};  label.tL0 = {'time since birth', 'SVL', 'low food'};  
temp.tL0   = C2K(28);  units.temp.tL0 = 'K'; label.temp.tL0 = 'temperature';
bibkey.tL0 = 'ForsLind1996';

% t-W data high food
data.tW1 = [ ... % time since birth (d), total length (cm)
0	5.192
0	5.499
0	5.794
0	6.149
0	5.027
0	6.212
0	5.268
0	5.980
0	6.570
28	7.839
28	7.194
28	9.860
28	9.155
28	10.109
28	8.574
28	9.048
28	9.054
28	10.126
28	10.251
63	9.851
63	10.217
63	10.403
63	11.009
63	12.987
63	12.703
63	12.345
63	11.271
63	14.809
98	15.109
98	16.709
98	16.780
98	18.736
98	16.962
98	17.318
98	17.792
98	19.874
98	20.652];
units.tW1  = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'high food'};  
temp.tW1   = C2K(28);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'ForsLind1996';
% low food
data.tW0 = [ ... % time since birth (yr), SVL (cm)
0	5.491
0	5.377
0	5.499
0	4.913
0	6.389
0	6.928
28	7.365
28	8.313
28	8.972
28	8.029
28	6.909
28	7.738
28	8.509
28	9.344
63	6.177
63	8.335
63	7.088
63	6.372
63	7.865
63	9.604
63	8.835
63	10.706
98	9.266
98	9.329
98	10.163
98	11.537
98	7.567
98	10.886
98	10.949
98	11.731
98	15.421];
units.tW0  = {'d', 'g'};  label.tW0 = {'time since birth', 'wet weight', 'low food'};  
temp.tW0   = C2K(28);  units.temp.tW0 = 'K'; label.temp.tW0 = 'temperature';
bibkey.tW0 = 'ForsLind1996';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL0'}; subtitle1 = {'Data for high, low food'};
set2 = {'tW1','tW0'}; subtitle2 = {'Data for high, low food'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'From1969'; 
F2 = 'Males smaller than females, especially in weight';
metaData.bibkey.F2 = 'From1969'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5BJ7Y'; % Cat of Life
metaData.links.id_ITIS = '634988'; % ITIS
metaData.links.id_EoL = '47364752'; % Ency of Life
metaData.links.id_Wiki = 'Vipera_berus'; % Wikipedia
metaData.links.id_ADW = 'Vipera_berus'; % ADW
metaData.links.id_Taxo = '50340'; % Taxonomicon
metaData.links.id_WoRMS = '1506591'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Vipera&species=berus'; % ReptileDB
metaData.links.id_AnAge = 'Vipera_berus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Vipera_berus}}';
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
bibkey = 'ForsLind1996'; type = 'Article'; bib = [ ... 
'author = {A. Forsman and L. E. Lindell}, ' ... 
'year = {1996}, ' ...
'title = {Resource dependent growth and body condition dynmaics in juvenile snakes: an experiment}, ' ...
'journal = {Oecologia}, ' ...
'volume = {108}, ' ...
'pages = {669-675}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EngeFrit1993'; type = 'Book'; bib = [ ... 
 'title = {Lurche und Kriechtiere Europas}, ' ...
 'publisher = {Neumann Verlag}, ' ...
 'year = {1993}, ' ...
 'author = {Engelmann, W.-E. and Fritzsche, J. and G\"{u}nther, R. and Obst, F. J.}, ' ...
 'address = {Radebeul}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/adder/vipera-berus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StumStri2006'; type = 'Book'; bib = [ ... 
  'title =     {Veldgids Amphibieen en reptielen}, ' ...
  'publisher = {KNNV}, ' ...
  'year =      {2006}, ' ...
  'author =    {Stumpel, T. and Strijbosch, H.}, ' ...
  'address =   {Utrecht}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'From1969'; type = 'Book'; bib = [ ... 
  'title = {Die Kreuzotter (\emph{Vipera berus} [Linnaeus])}, ' ...
  'publisher = {A. Ziemsen Verlag}, ' ...
  'year = {1969}, ' ...
  'author = {Frommhold, E.}, ' ....
  'volume = {332}, ' ...
  'series = {Die Neue Brehm Bucherei}, ' ...
  'address = {Wittenberg Lutherstadt}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

