  function [data, auxData, metaData, txtData, weights] = mydata_Spirinchus_thaleichthys

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osmeriformes'; 
metaData.family     = 'Osmeridae';
metaData.species    = 'Spirinchus_thaleichthys'; 
metaData.species_en = 'Longfin smelt';

metaData.ecoCode.climate = {'MC','Dfb'};
metaData.ecoCode.ecozone = {'MPNE','THn'};
metaData.ecoCode.habitat = {'0jFe', '0jFl', 'jiMcp'};
metaData.ecoCode.embryo  = {'Fs', 'Fg', 'Fh'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L_f'; 't-Ww_f'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 10 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 12]; 

%% set data
% zero-variate data
data.am = 3*365;  units.am = 'd';   label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 20;   units.Li = 'cm';  label.Li = 'ultimate total length';    bibkey.Li = 'fishbase';

data.Wwb = 4.49e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'ChigSibl1994';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 4;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00389*Lp^3.16, see F1';
data.Wwi = 50.3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.16, see F1';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (mnth), std length (cm)
15.895	9.686
19.869	10.861
22.921	11.037];
data.tL(:,1) = data.tL(:,1) * 30.5; % convert mnth to d
data.tL(:,2) = data.tL(:,2)/ 0.86; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length', 'year class 1989'};  
temp.tL = C2K(9); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'ChigSibl1994'};
comment.tL = 'year class 1989';
%
data.tL1 = [ ... % time since birth (mnth), std length (cm)
14.981	6.867
15.965	7.587
16.864	7.504
18.927	7.878
20.930	8.105
20.958	8.581
21.912	9.202
22.961	9.020
23.887	9.216];
data.tL1(:,1) = data.tL1(:,1) * 30.5; % convert mnth to d
data.tL1(:,2) = data.tL1(:,2)/ 0.86; % convert SL to TL
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'total length', 'year class 1988+1990'};  
temp.tL1 = C2K(9); units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = {'ChigSibl1994'};
comment.tL1 = 'year class 1988+1990';

% time-weight
data.tWw = [ ... % time since birt (mnth), wet weight (g)
15.967	10.244
19.961	16.807
23.048	18.139];
data.tWw(:,1) = data.tWw(:,1) * 30.5; % convert mnth to d
units.tWw = {'d', 'g'}; label.tWw = {'time since birth', 'wet weight', 'year class 1989'};  
temp.tWw = C2K(9); units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = {'ChigSibl1994'};
comment.tWw = 'year class 1989';
%
data.tWw1 = [ ... % time since birt (mnth), wet weight (g)
14.988	3.512
15.975	4.496
16.963	4.437
18.878	4.758
18.968	5.197
20.973	6.726
21.002	5.682
21.930	9.634
22.948	9.080
23.905	8.581];
data.tWw1(:,1) = data.tWw1(:,1) * 30.5; % convert mnth to d
units.tWw1 = {'d', 'g'}; label.tWw1 = {'time since birth', 'wet weight', 'year class 1988+1990'};  
temp.tWw1 = C2K(9); units.temp.tWw1 = 'K'; label.temp.tWw1 = 'temperature';
bibkey.tWw1 = {'ChigSibl1994'};
comment.tWw1 = 'year class 1988+1990';

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
8.497	6445.753
8.696	6863.244
8.888	8749.341
8.904	7962.465
9.279	8850.143
9.301	6856.897
9.309	6122.551
9.487	10998.309
9.502	10211.433
9.708	8373.608
9.781	10785.430
10.290	10045.824
10.386	11146.214
10.474	11879.557
10.586	11930.835
10.673	10828.524
10.674	12087.258
10.771	16334.484
10.888	10668.927
10.992	12031.470
11.182	9826.681
11.265	16119.517
11.269	23671.923
11.275	20997.029
11.279	12552.936
11.771	9715.606
11.862	15955.912
11.973	14958.244
12.078	18366.231
12.384	23817.572
12.574	22242.150];
data.LN(:,1) = data.LN(:,1)/ 0.86; % convert SL to TL
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(9); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = {'ChigSibl1994'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tL1 = 5 * weights.tL1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data for yr class 1989, 1988+1990'};
set2 = {'tWw','tWw1'}; subtitle2 = {'Data for yr class 1989, 1988+1990'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.86 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);
                                 
%% Links
metaData.links.id_CoL = '4Z7D9'; % Cat of Life
metaData.links.id_ITIS = '162049'; % ITIS
metaData.links.id_EoL = '46563020'; % Ency of Life
metaData.links.id_Wiki = 'Spirinchus_thaleichthys'; % Wikipedia
metaData.links.id_ADW = 'Spirinchus_thaleichthys'; % ADW
metaData.links.id_Taxo = '187969'; % Taxonomicon
metaData.links.id_WoRMS = '282844'; % WoRMS
metaData.links.id_fishbase = 'Spirinchus-thaleichthys'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Spirinchus_thaleichthys}}';  
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
bibkey = 'ChigSibl1994'; type = 'Article'; bib = [ ...  
'author = {P. Chigbu and T. H. Sibly}, ' ...
'year = {1994}, ' ...
'title = {Relationships between abundance, growth, egg size and fecundity in landlocked population of longfin smelt \emph{Spirinchus thaleichthys}}, ' ... 
'journal = {J. Fish Biol.}, ' ...
'volume = {45}, '...
'pages = {1-15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Spirinchus-thaleichthys.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
