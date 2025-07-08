function [data, auxData, metaData, txtData, weights] = mydata_Cerorhinca_monocerata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Alcidae';
metaData.species    = 'Cerorhinca_monocerata'; 
metaData.species_en = 'Rhinoceros auklet'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'xiMcp', '0bTd'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCik', 'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'ax-Wwx_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 11 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 26];

%% set data
% zero-variate data

data.ab = 45;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 45;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Harf1995';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 135;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 1095;        units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 28.2*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 54.5;         units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 544.1;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.txWx_1990 = [ ... % time since birth at fledging (d), wet weight at fledging (g)
46.932	409.827
47.950	394.798
47.988	413.295
47.989	410.983
48.869	394.798
50.983	293.642
50.987	383.815
50.989	379.191
50.991	375.145
51.021	310.983
51.029	392.486
51.890	319.075
51.915	364.740
51.924	343.931
51.958	371.676
52.986	332.370
52.990	324.855
53.898	347.399
53.900	344.509
53.932	373.410
53.936	366.474
54.952	353.179
54.956	346.243
55.037	368.208
55.972	334.682
55.976	324.277
56.005	361.850
56.008	355.491
56.962	379.191
56.983	333.526
57.906	323.699
57.950	327.746
58.081	342.197
58.914	329.480
58.948	256.647
58.954	343.931
59.012	316.763
59.020	300.000
59.996	274.566
60.009	345.665
60.013	337.572
60.025	311.561
60.081	290.751
60.957	283.237
62.065	272.254
63.024	284.393
63.992	277.457];
units.txWx_1990   = {'d', 'g'};  label.txWx_1990 = {'time since birth at fledging', 'weight at fledging'};  
temp.txWx_1990    = C2K(40.7);  units.temp.txWx_1990 = 'K'; label.temp.txWx_1990 = 'temperature';
bibkey.txWx_1990  = 'Harf1995';
comment.txWx_1990 = 'Data from 1990';
% time-weight, food restricted level 1
data.txWx_1989 = [ ... % time since birth at fledging (d), wet weight at fledging (g)
42.994	428.756
43.124	451.245
44.052	430.969
46.084	436.491
47.098	421.153
48.027	411.846
48.028	421.170
48.069	406.911
49.042	408.026
49.043	417.349
50.058	407.496
50.059	411.883
51.028	387.221
51.075	422.322
52.006	422.888
52.044	391.627
52.089	407.533
53.012	355.447
53.017	390.548
53.018	397.678
53.062	411.938
53.100	381.226
54.072	366.436
54.117	389.471
54.120	413.054
54.965	402.649
55.006	394.972
55.089	382.359
55.968	314.916
55.977	375.794
55.981	402.120
56.021	389.506
56.022	392.248
56.062	380.732
56.063	384.022
56.995	392.266
57.030	340.713
57.035	376.910
58.002	335.246
58.051	379.671
58.978	353.363
58.979	361.041
59.022	368.172
59.067	382.432
59.994	354.478
59.995	361.059
59.996	365.447
60.034	341.316
60.041	391.773
61.136	356.144
62.069	372.066
63.039	344.113
64.048	300.256];
units.txWx_1989   = {'d', 'g'};  label.txWx_1989 = {'time since birth at fledging', 'weight at fledging'};  
temp.txWx_1989    = C2K(40.7);  units.temp.txWx_1989 = 'K'; label.temp.txWx_1989 = 'temperature';
bibkey.txWx_1989  = 'Harf1995';
comment.txWx_1989 = 'Data from 1989';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;


%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'txWx_1990','txWx_1989'}; subtitle1 = {'Data from 1990, 1989'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'T4FG'; % Cat of Life
metaData.links.id_ITIS = '177023'; % ITIS
metaData.links.id_EoL = '45509368'; % Ency of Life
metaData.links.id_Wiki = 'Cerorhinca_monocerata'; % Wikipedia
metaData.links.id_ADW = 'Cerorhinca_monocerata'; % ADW
metaData.links.id_Taxo = '53902'; % Taxonomicon
metaData.links.id_WoRMS = '344029'; % WoRMS
metaData.links.id_avibase = '53D94597DFB84ECB'; % avibase
metaData.links.id_birdlife = 'rhinoceros-auklet-cerorhinca-monocerata'; % birdlife
metaData.links.id_AnAge = 'Cerorhinca_monocerata'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cerorhinca_monocerata}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cerorhinca_monocerata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harf1995'; type = 'Article'; bib = [ ...  
'title = {EFFECTS OF GROWTH-RATE VARIATION ON FLEDGING OF RHINOCEROS AUKLETS (\emph{Cerorhinca monocerata})}, ' ...
'journal = {The Auk}, ' ...
'volume = {112}, ' ...
'number = {1}, ' ...
'pages = {60--66}, ' ...
'year = {1995}, ' ...
'author = {A, HARFENIST}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

