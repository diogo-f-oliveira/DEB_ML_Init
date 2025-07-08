function [data, auxData, metaData, txtData, weights] = mydata_Valvata_cristata
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Valvatoida'; 
metaData.family     = 'Valvatidae';
metaData.species    = 'Valvata_cristata'; 
metaData.species_en = 'Crested valve snail'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biHa'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 'T-ab'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 23]; 

%% set data
% zero-variate data

data.am = 1170; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Myzy2002';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'uder good feeding conditions 377 d, upto 1170 under poor feeding conditions';
  
data.Lb  = 0.038; units.Lb  = 'cm';  label.Lb  = 'shell height at birth';             bibkey.Lb  = 'Myzy2002';
data.Lj  = 0.039; units.Lj  = 'cm';  label.Lj  = 'shell height at settlement';        bibkey.Lj  = 'Myzy2002';
data.Lp  = 0.2475; units.Lp  = 'cm';  label.Lp  = 'shell height at puberty for female'; bibkey.Lp  = 'Myzy2002';
  comment.Lp = '2.05-2.95 mm';
data.Li  = 0.393; units.Li  = 'cm';  label.Li  = 'ultimate shell length';              bibkey.Li  = 'Myzy2002';

data.Wwi  = 1.98e-2; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Planorbis planorbis (including shell): 4.336e-1 * (0.393/1.1)^3';

data.Ni  = 134;   units.Ni  = '#'; label.Ni  = 'lifetime reprod output'; bibkey.Ni  = 'Myzy2002';   
  temp.Ni = C2K(18);   units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = '51 cocoons';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), shell heigth (mm)
0.918	0.421
18.807	0.712
28.151	0.955
51.271	1.149
80.246	1.521
106.818	1.715
129.929	1.893
159.961	2.103
183.007	2.168
224.507	2.313
254.474	2.409
292.522	2.555
317.888	2.651
354.729	2.700
382.424	2.845
408.902	2.877
437.672	2.893
469.875	2.876
496.382	2.957
524.057	3.070
539.022	3.086
557.457	3.134
575.855	3.118
602.361	3.198
631.141	3.230
666.851	3.311
719.836	3.423
762.430	3.471
792.313	3.422
813.030	3.438
837.189	3.438
868.363	3.632
901.725	3.631
992.666	3.727
1082.390	3.710
1142.231	3.741];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Myzy2002';
    
% temperature - age at birth
data.Tab = [ ... % temperature (C), incubation time (d)
11.991	24.909
12.981	22.200
13.998	21.436
14.975	16.935
15.964	15.659
16.982	13.769
17.985	12.288
19.030	11.779
19.977	10.861
20.979	10.403
21.996	9.946
23.014	8.823
23.974	8.570
25.005	7.396
26.008	7.553
26.997	6.532];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'Myzy2002';

%% set weights for all real data
weights = setweights(data, []);
weights.Tab = 5 * weights.Tab;
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'I invented the order-name Valvatoida myself, to comply to the makeup of the list-page';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'This snail is hermaphroditic';
metaData.bibkey.F1 = 'Myzy2002';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8V9YL'; % Cat of Life: not present 2021/08/07
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '51510209'; % Ency of Life
metaData.links.id_Wiki = 'Valvata_cristata'; % Wikipedia
metaData.links.id_ADW = ''; % ADW not present
metaData.links.id_Taxo = '35175'; % Taxonomicon
metaData.links.id_WoRMS = '153996'; % WoRMS 
metaData.links.id_molluscabase = '153996'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Valvata_cristata}}';
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
bibkey = 'Myzy2002'; type = 'Article'; bib = [ ... 
'author = {Stanis{\l}aw Myzyk}, ' ... 
'year = {2002}, ' ...
'title = {LIFE CYCLE OF \emph{Valvata cristata} {O}. {F}. {M}\"{u}ller, 1774 ({G}ASTROPODA: {H}ETEROBRANCHIA) IN THE LABORATORY}, ' ...
'journal = {Folia Malacologica}, ' ...
'volume = {10}, ' ...
'pages = {47-75}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
