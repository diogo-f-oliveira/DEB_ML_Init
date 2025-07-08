function [data, auxData, metaData, txtData, weights] = mydata_Notonecta_maculata   

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Hemiptera'; 
metaData.family     = 'Notonectidae';
metaData.species    = 'Notonecta_maculata'; 
metaData.species_en = 'Backswimmer'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wdb'; 'Wdi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 't-Wd'; 'L-Wd'; 't-S'; 'T-ab'; 'T-ap'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Andre Gergs'};            
metaData.date_subm = [2017 05 24];       
metaData.email    = {'Gergs@gaiac.rwth-aachen.de'};    
metaData.address  = {'gaiac, 52072, Germany'};   

metaData.author_mod_1   = {'Bas Kooijman'};            
metaData.date_mod_1     = [2018 10 31];       
metaData.email_mod_1    = {'Gergs@gaiac.rwth-aachen.de'};    
metaData.address_mod_1  = {'gaiac, 52072, Germany'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 10 31]; 

%% set data
% zero-variate data;
data.ab = 17.58;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'GergJage2014';    
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 52.38+17.58;     units.ap = 'd';    label.ap = 'age at puberty';              bibkey.ap = 'GergJage2014';
  temp.ap = C2K(20);  units.temp.ap = 'K'; label.temp.ap = 'temperature'; 
  comment.ap = 'puberty is assumed to coincide with moult into winged stage'; 
data.am = 2.5*30.5; units.am = 'd';    label.am = 'life span as imago';                bibkey.am = 'Gerg2010';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.25;    units.Lb  = 'cm';   label.Lb  = 'length at birth';                  bibkey.Lb  = 'GergJage2014'; 
data.Li  = 1.6;     units.Li  = 'cm';   label.Li  = 'ultimate length';                  bibkey.Li  = 'SavaMaca1989';

data.Wdb = 0.00027; units.Wdb = 'g';    label.Wdb = 'dry weight at birth';              bibkey.Wdb = 'Gerg2010';
data.Wdi = 0.03;    units.Wdi = 'g';    label.Wdi = 'ultimate dry weight';              bibkey.Wdi = 'Gerg2010';

data.Ri = 60/14;     units.Ri = '#';     label.Ri = 'ultimate reproductive rate';        bibkey.Ri = 'Gerg2010';   
temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';  
  comment.Ri='adults lay eggs in autumn and most die during winter; few individuals survive till spring and eventually lay a second clutch off eggs; in laboratory cultures reproduction appears to happen at a faster rate: clutch size is ~60 eggs layed in early autumn, and assumes rate is 60 eggs/14 days, which is more of a guess';

% uni-variate data 
%time [d], length [cm]
data.tL = [   1   8    15   23   34   52;    % d, time since birth
            0.25 0.44 0.63 0.88 1.20 1.35]';  % cm, length at f and T      
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'length'};  bibkey.tL = 'GergJage2014';
  temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';

%length [cm], dry weight [g]  
data.LW = [0.31	0.44	0.63	0.88	1.2	1.35;      % cm, length at f
         0.0003	0.001	0.0031	0.0076	0.0161	0.025 ]';   % g, dry weight at f and T         
units.LW = {'cm', 'g'};     label.LW = {'length', 'dry weight'};  bibkey.LW = 'GergJage2014';

% time since birth [d], dry weight [g] at 20 C
data.tW = [ ... % time since birth (d), dry weight (g)
1	0.0002721
1	0.000271
1	0.000214
1	0.0003156
1	0.0002954
1	0.0002445
2	0.0002614
2	0.0002647
2	0.0002447
2	0.0002424
2	0.0002632
4	0.0003165
4	0.0003365
4	0.0003141
4	0.0003598
4	0.0003408
6	0.0004533
6	0.00053
6	0.0005298
6	0.0005824
8	0.0006197
8	0.0006357
8	0.0005543
8	0.0005842
9	0.0005964
9	0.0005741
9	0.0005127
9	0.0004379
9	0.0005906
11	0.0007692
11	0.0008943
11	0.000841
11	0.0009296
11	0.0007168
13	0.0013957
13	0.0013297
13	0.0010202
13	0.0008742
13	0.0009557
15	0.0015348
15	0.001394
15	0.001429
15	0.0016645
15	0.0014597
15	0.0012579
16	0.001526
16	0.0016225
16	0.001642
16	0.0015397
16	0.0014893
18	0.0026593
18	0.0024011
18	0.002542
18	0.0025708
18	0.0025395
20	0.0037006
20	0.0035045
20	0.0032584
20	0.0038224
20	0.0037998
23	0.003933
23	0.0051426
23	0.0045683
23	0.0052902
23	0.0054158
24	0.0053705
24	0.0038641
24	0.0042499
24	0.0048669
24	0.0045611
26	0.0062583
26	0.0060488
26	0.0056089
26	0.0068685
26	0.0055061
28	0.0087345
28	0.0100483
28	0.0089561
28	0.0090107
28	0.0086054
30	0.0085403
30	0.0101122
30	0.0125748
30	0.0110147
30	0.0109304
33	0.0131205
33	0.0111851
33	0.011423
33	0.0123553
33	0.0106959
34	0.0120565
34	0.0111071
34	0.012217
34	0.0122725
34	0.0117364
39	0.0205314
39	0.0216523
39	0.0208904
39	0.0210928
39	0.0183747
45	0.0328432
45	0.0290821
45	0.0293227
45	0.0280519
45	0.0277716
51	0.0298466
51	0.0315726
51	0.0283015
51	0.0349604
51	0.0305538
];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'dry weight'};  
temp.tW    = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Gerg2010';

%time since birth, survival at 15 C
data.tS = [ ... % time (day), surviving fraction (-)
1	1
2	0.93
11	0.89
12	0.85
17	0.81
24	0.78
52	0.74
58	0.7
60	0.67
66	0.63
69	0.59
70	0.56
74	0.52
75	0.48
80	0.44
81	0.41
105	0.37
116	0.33
];
units.tS   = {'d', '-'};  label.tS = {'time', 'surviving fraction'};  
temp.tS    = C2K(15);  units.temp.tS = 'K'; label.temp.tS = 'temperature';
bibkey.tS = 'Gerg2010';

%temperature, egg development time [d]
data.Tab = [ ... % temperature (C), time (d)
10	43.77
15	37.16
20	17.57
25	12.82
];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'egg development time'};  
bibkey.Tab = 'Gerg2010';

%temperature, time since birth at puberty [d]
data.Tap = [ ... % temperature (C), time (d)
15	    121.28
20	    52.38
24	    40.19
27.5	32.90
];
units.Tap   = {'C', 'd'};  label.Tap = {'temperature', 'maturation time'};  
bibkey.Tap = 'Gerg2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tS =  5 * weights.tS;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: k_J set at 0.002 1/d';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7W3FX'; % Cat of Life
metaData.links.id_ITIS = '103564'; % ITIS
metaData.links.id_EoL = '612774'; % Ency of Life
metaData.links.id_Wiki = 'Notonecta_maculata'; % Wikipedia
metaData.links.id_ADW = 'Notonecta_maculata'; % ADW
metaData.links.id_Taxo = '18437'; % Taxonomicon

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notonecta_maculata}},'...% replace my_pet by latin species name
'note = {Accessed : 2017-05-28}'];
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
bibkey = 'GergJage2014'; type = 'Article'; bib = [ ...  
'author = {Gergs, A. and Jager, T.}, '...
'year = {2014}, '...
'title = {Body size mediated starvation resistance in an insect predator},'...
'journal = {Journal of Animal Ecology}, '...
'volume = {83}, '...
'number = {4}, '...
'pages = {758-768}, '...
'DOI = {10.1111/1365-2656.12195}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gerg2010'; type = 'Misc'; bib = [ ... 
'author = {Gergs, A.}, ' ...
'note = {Unpublished}, ' ...
'year = {2010}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SavaMaca1989'; type = 'Book'; bib = [ ...  
'author = {Savage, A. A. and Macan, T. T.}, ' ...
'year = {1989}, ' ...
'title  = {Adults of the British aquatic Hemitera Heteroptera: a key with ecological notes}, ' ...
'publisher = {Freshwater Biological Association Scientific Publication No. 50}, ' ...
'pages = {Page 57}, ' ...
'url = {https://www.fba.org.uk/identifying-freshwater-organisms}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

