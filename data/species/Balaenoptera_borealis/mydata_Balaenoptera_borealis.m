function [data, auxData, metaData, txtData, weights] = mydata_Balaenoptera_borealis

%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Balaenopteridae';
metaData.species    = 'Balaenoptera_borealis'; 
metaData.species_en = 'Sei whale'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic', 'xiCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37);% K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Le'; 't-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2018 07 24];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 07 23];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2023 08 13];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 13];  

%% set data
% zero-variate data
data.tg = 345;     units.tg = 'd';    label.tg = 'gestation time';                     bibkey.tg = 'AnAge';    
  temp.tg = C2K(37); units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx =  266;      units.tx = 'd';    label.tx = 'time since birth at weaning';      bibkey.tx = 'AnAge';    
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 3652;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3652;    units.tpm = 'd';  label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 74*365;   units.am = 'd';    label.am = 'life span';                          bibkey.am = 'AnAge';   
  temp.am = C2K(37); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 445;     units.Lb = 'cm';   label.Lb = 'total length at birth';               bibkey.Lb = 'Wiki';
data.Lp = 1430;    units.Lp = 'cm';   label.Lp = 'total length at puberty';             bibkey.Lp = 'Lock1981';
  comment.Lp = 'length read from tL_f data for tp';
data.Lpm = 1390;    units.Lpm = 'cm';   label.Lpm = 'total length at puberty';          bibkey.Lpm = 'Lock1981';
  comment.Lpm = 'length read from tL_m data for tpm';
data.Li = 1500;    units.Li = 'cm';   label.Li = 'ultimate total length for female';    bibkey.Li = 'Lock1981';
data.Lim = 1470;    units.Lim = 'cm';   label.Lim = 'ultimate total length for male';   bibkey.Lim = 'Lock1981';

data.Wwb = 680e3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                  bibkey.Wwb = 'AnAge';
data.Wwp = 16e6;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'Lock1981';
  comment.Wwpm = 'weight read from tW_m data for tp';
data.Wwpm = 15.3e6;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males'; bibkey.Wwpm = 'Lock1981';
  comment.Wwpm = 'weight read from tW_m data for tpm';
data.Wwi = 19e6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'Lock1981';
data.Wwim = 17.5e6;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Lock1981';

data.Ri = 0.5/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';                 bibkey.Ri = 'AnAge';   
  temp.Ri = C2K(37); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time - length
data.tL_f = [ ... % time since birth (yr), length (m)
0.038	5.340
0.065	7.207
0.223	8.745
0.383	10.677
0.692	11.495
1.441	12.147
2.671	12.569
4.298	13.153
5.770	13.542
7.417	13.864
9.592	14.217
11.810	14.472
14.620	14.724
16.662	14.783
19.824	15.002];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
data.tL_f(:,2) = 100 * data.tL_f(:,2); % convert m to cm
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'length', 'female'};
  temp.tL_f = C2K(37); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Lock1981';
comment.tL_f = 'Data for females, reconstructed data from curve';
%
data.tL_m = [ ... % time since birth (yr), length (cm)
0.037	5.307
0.285	7.533
0.489	9.498
0.712	10.873
1.110	11.559
2.604	12.111
4.648	12.825
6.471	13.277
8.492	13.664
10.776	14.016
13.148	14.238
15.475	14.263
18.813	14.514
19.889	14.707];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
data.tL_m(:,2) = 100 * data.tL_m(:,2); % convert m to cm
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'length', 'male'};
  temp.tL_m = C2K(37); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Lock1981';
comment.tL_m = 'Data for males, reconstructed data from curve';

% time - weight
data.tW_f = [ ... % time since birth (yr), weight (ton)
0.001	0.954
0.141	3.454
0.349	6.045
0.556	7.999
3.936	11.855
5.808	13.623
7.976	15.164
10.965	16.611
13.726	17.605
16.098	18.236
18.744	18.548
20.044	18.818];
data.tW_f(:,1) = 365 * data.tW_f(:,1); % convert yr to d
data.tW_f(:,2) = 1e6 * data.tW_f(:,2); % convert ton to g
units.tW_f = {'d', 'g'};     label.tW_f = {'time since birth', 'weight', 'female'};
  temp.tW_f = C2K(37); units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Lock1981';
comment.tW_f = 'Data for females, reconstructed data from curve';
%
data.tW_m = [ ... % time since birth (yr), length (cm)
0.024	1.000
0.164	3.590
0.417	5.499
0.738	7.635
0.967	8.452
4.027	11.354
5.785	13.032
8.021	14.436
11.466	15.838
15.344	16.647
19.997	17.227];
data.tW_m(:,1) = 365 * data.tW_m(:,1); % convert yr to d
data.tW_m(:,2) = 1e6 * data.tW_m(:,2); % convert ton to g
units.tW_m = {'d', 'g'};     label.tW_m = {'time since birth', 'weight', 'male'};
  temp.tW_m = C2K(37); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Lock1981';
comment.tW_m = 'Data for males, reconstructed data from curve';

% time-length for foetus 
data.tLe = [ ... % time since dec 1 (d), length (cm)
106.662	48.779
137.068	64.247
168.453	87.259
197.917	114.120
228.363	149.788
258.348	196.834
289.808	258.986
318.885	335.101
349.744	335.403];
units.tLe  = {'d', 'cm'};  label.tLe = {'time since dec 1', 'length'};  
temp.tLe  = C2K(37);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'Laws1959';
comment.tLe = 'Data from northern hemisphere';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 2 * weights.tL_f;
weights.tL_m = 2 * weights.tL_m;
weights.tW_f = 0.2 * weights.tW_f;
weights.tW_m = 0.2 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_1: increased assimilation during lactation';
D4 = 'mod_2: k reduced,  k_J released';
D5 = 'mod_3: tLe data added';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = 'KF8M'; % Cat of Life
metaData.links.id_ITIS = '180526'; % ITIS
metaData.links.id_EoL = '46559429'; % Ency of Life
metaData.links.id_Wiki = 'Balaenoptera_borealis'; % Wikipedia
metaData.links.id_ADW = 'Balaenoptera_borealis'; % ADW
metaData.links.id_Taxo = '68886'; % Taxonomicon
metaData.links.id_WoRMS = '137088'; % WoRMS
metaData.links.id_MSW3 = '14300014'; % MSW3
metaData.links.id_AnAge = 'Balaenoptera_borealis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.Wikipedia.org/wiki/Balaenoptera_borealis}}';
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
bibkey = 'Lock1981'; type = 'Incollection'; bib = [ ...
'author = {Lockyer, C.}, '...
'title = {Growth and energy budgets of large baleen whales from the southern hemisphere.}, '...
'booktitle = {Mammals in the Seas}, ' ...
'publisher = {FAO}, ' ...
'year = {1981}, ' ...
'volume = {III}, ' ...
'series = {FAO Fisheries series No 5}, ' ...
'address = {Rome}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Balaenoptera_borealis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Laws1959'; type = 'techreport'; bib = [ ... 
'author = {Laws, R. M.}, ' ... 
'year = {1959}, ' ...
'title = {The foetal growth rates of whales with special reference to the fin whale, \emph{Balaenoptera physalus} {L}inn}, ' ...
'institution = {Nat. Inst of Oceanography}, ' ...
'volume = {29}, ' ...
'pages = {281-308}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

