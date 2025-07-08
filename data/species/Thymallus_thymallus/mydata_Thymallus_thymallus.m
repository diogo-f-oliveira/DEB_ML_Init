  function [data, auxData, metaData, txtData, weights] = mydata_Thymallus_thymallus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Thymallus_thymallus'; 
metaData.species_en = 'Grayling'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ah_T'; 'ap'; 'am'; 'Lh'; 'Lp'; 'Li'; 'R_L'; 'GSI'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L_f'; 't-Ww'; 'L-Ww'; 'T-ah'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2012 04 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 18]; 

%% set data
% zero-variate data
data.ah_8 = 22;    units.ah_8 = 'd';  label.ah_8 = 'age at hath at 8C';      bibkey.ah_8 = 'IngrIbbo20aa'; 
  temp.ah_8 = C2K(8); units.temp.ah_8 = 'K'; label.temp.ah_8 = 'temperature'; 
data.ah_13 = 14.7; units.ah_13 = 'd'; label.ah_13 = 'age at hath at 13C';    bibkey.ah_13 = 'IngrIbbo20aa'; 
  temp.ah_13 = C2K(13); units.temp.ah_13 = 'K'; label.temp.ah_13 = 'temperature'; 
data.ah_15 = 8;    units.ah_15 = 'd'; label.ah_15 = 'age at hath at 15C';    bibkey.ah_15 = 'IngrIbbo20aa'; 
  temp.ah_15 = C2K(15); units.temp.ah_15 = 'K'; label.temp.ah_15 = 'temperature'; 
data.ap = 365;     units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'Laak2008';
  temp.ap = C2K(13); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'temp is guessed';
data.am = 14*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = {'IngrIbbo20aa'};   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'temperature: 3-11 C';

data.Lh = 1.7;     units.Lh = 'cm';   label.Lh = 'total length at hatch';    bibkey.Lh = 'IngrIbbo20aa'; 
data.Lp = 23;     units.Lp = 'cm';    label.Lp = 'total length at puberty';  bibkey.Lp = 'Laak2008'; 
data.Li = 60;     units.Li = 'cm';    label.Li = 'ultimate total length';    bibkey.Li = {'fishbase'};
 
data.R45 = 36240/365;   units.R45 = '#/d';  label.R45 = 'reprod rate at 45 cm, 1160 g, 9 yr';  bibkey.R45 = {'Laak2008'};   
  temp.R45 = C2K(7); units.temp.R45 = 'K'; label.temp.R45 = 'temperature'; 
  comment.R45 = 'temperature, IngrIbbo20aa: 3-11 C';
data.GSI = 1/6;   units.GSI = '-';    label.GSI = 'Gonado som index';        bibkey.GSI = {'Laak2008'};   
  temp.GSI = C2K(7);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 
  comment.GSI = 'temperature, IngrIbbo20aa: 3-11 C';
    
% uni-variate data
% time-length
data.tL_Test = [... % time since birth (year), length (cm)
1.010	15.845
1.969	28.593
2.991	35.235
4.010	38.592
4.981	41.198
5.974	43.053];
data.tL_Test(:,1) = 365 * data.tL_Test(:,1); % convert year to d
units.tL_Test = {'d', 'cm'}; label.tL_Test = {'time since birth', 'total(?) length', 'River Test'}; 
  temp.tL_Test = C2K(7); units.temp.tL_Test = 'K'; label.temp.tL_Test = 'temperature';
  bibkey.tL_Test = {'Hell1969'};
  comment.tL_Test = 'River Test; temp is guessed; Type of length is uncertain'; 
%
data.tL_Storsjo = [ ...
0.985	8.483
1.987	16.088
2.989	23.181
3.971	28.519
4.988	31.810
5.985	33.711
6.984	37.879];
data.tL_Storsjo(:,1) = 365 * data.tL_Storsjo(:,1); % convert year to d
units.tL_Storsjo = {'d', 'cm'}; label.tL_Storsjo = {'time since birth', 'total(?) length', 'River Storsjo'}; 
  temp.tL_Storsjo = C2K(7); units.temp.tL_Storsjo = 'K'; label.temp.tL_Storsjo = 'temperature';
  bibkey.tL_Storsjo = {'Hell1969'};
  comment.tL_Storsjo = 'River Storsjo; temp is guessed'; 
%
data.tL_Indals = [ ...
0.986	9.580
1.989	17.623
2.970	22.815
3.972	29.762
5.028	34.881
5.971	38.537
6.968	40.731
7.946	41.389];
data.tL_Indals(:,1) = 365 * data.tL_Indals(:,1); % convert year to d
units.tL_Indals = {'d', 'cm'}; label.tL_Indals = {'time since birth', 'total(?) length', 'River Indals'}; 
  temp.tL_Indals = C2K(7); units.temp.tL_Indals = 'K'; label.temp.tL_Indals = 'temperature';
  bibkey.tL_Indals = {'Hell1969'};
  comment.tL_Indals = 'River Indals; temp is guessed'; 
%
data.tL_Llyn = [ ...
1.972	19.378
2.972	24.132
3.938	32.468
4.973	35.978
5.953	38.976
6.952	42.486];
data.tL_Llyn(:,1) = 365 * data.tL_Llyn(:,1); % convert year to d
units.tL_Llyn = {'d', 'cm'}; label.tL_Llyn = {'time since birth', 'total(?) length', 'River Llyn'};
  temp.tL_Llyn = C2K(7); units.temp.tL_Llyn = 'K'; label.temp.tL_Llyn = 'temperature';
  bibkey.tL_Llyn = {'Hell1969'};
  comment.tL_Llyn = 'River Llyn; temp is guessed'; 

% time-weight
data.tW = [ ... % time since birth (year), wet weight (g)
0.501	 19.392
1.493	 75.232
2.486	136.402
3.492	239.139
4.472	470.818];
data.tW(:,1) = 365 * data.tW(:,1); % convert year to d
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
  temp.tW = C2K(7); units.temp.tW = 'K'; label.temp.tW = 'temperature';
  bibkey.tW = {'Hell1969'};
  comment.tW = 'temp is guessed';

% length-weight
data.LW = [ ... % length (cm), wet weight (g)
14.086	 56.22
17.029	 74.76
20.163	 97.98
20.718	101.85
21.270	107.40
22.189	117.72
24.049	129.08
25.890	153.59
27.553	174.16
27.912	187.21
28.840	197.45
29.579	209.24
29.758	217.46
30.484	242.96
30.684	231.58
31.790	255.07
32.535	263.88
32.714	274.25
33.080	286.42
34.009	300.64
36.984	351.08
40.845	511.64];
units.LW = {'cm', 'g'}; label.LW = {'total(?) length', 'wet weight'};  
  bibkey.LW = {'Hell1969'};
% 
data.LW1 = [ ... fork length (cm), wet weight (g)
10.000	11.947
15.000	37.168
20.064	86.283
24.936	173.894
29.936	309.292
35.000	504.425];
units.LW1 = {'cm', 'g'}; label.LW1 = {'fork length', 'wet weight'};  
  bibkey.LW1 = {'Laak2008'};

% temperature-age at hatch
data.Tah = [ ... % temp (C), age at hatch (d)
 3.785	65.500
 5.672	45.402
 7.554	32.819
 9.271	23.385
11.230	18.076
13.473	13.981
15.511	12.067];
data.Tah(:,1) = C2K(data.Tah(:,1)); % convert C to K
units.Tah = {'K', 'd'}; label.Tah = {'temperature', 'age at hatch'};  
  bibkey.Tah = {'JungWink1984'};
 
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
set1 = {'tL_Test','tL_Storsjo','tL_Indals','tL_Llyn'};
subtitle1 = {'Hell1969 Data for rivers Test, Storsjo, Indals, Llyn'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = '30.5 cm total length corresponds with 27.0 cm fork length';
metaData.bibkey.F1 = 'Clar1992';
F2 = 'eggs are 3-4 mm, but 2 mm is also possible';
metaData.bibkey.F2 = 'Laak2008';
F3 = 'ab-ah is 2 till 5 d';
metaData.bibkey.F3 = 'Laak2008';
F4 = 'Clar1992: Lp = 28 cm';
metaData.bibkey.F4 = 'Clar1992';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '56Q8K'; % Cat of Life
metaData.links.id_ITIS = '162022'; % ITIS
metaData.links.id_EoL = '46563159'; % Ency of Life
metaData.links.id_Wiki = 'Thymallus_thymallus'; % Wikipedia
metaData.links.id_ADW = 'Thymallus_thymallus'; % ADW
metaData.links.id_Taxo = '42856'; % Taxonomicon
metaData.links.id_WoRMS = '154375'; % WoRMS
metaData.links.id_fishbase = 'Thymallus-thymallus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Thymallus_thymallus}}';  
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
bibkey = 'Laak2008'; type = 'Techreport'; bib = [ ...  
'author = {Laak, G. A. J. de}, ' ...
'year = {2008}, ' ...
'title = {Vlagzalm \emph{Thymallus thymallus} ({L}innaeus, 1758)}, ' ... 
'series = {Kennisdocument}, '...
'address = {Postbus 162, 3720 AD Bilthoven}, '...
'institution = {Sportvisserij Nederland}, ' ...
'volume = {8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JungWink1984'; type = 'Article'; bib = [ ...  
'author = {Jungwirth, M. and Winkler, H.}, ' ...
'year = {1984}, ' ...
'title = {The temperature dependence of embryonic development og grayling (\emph{Thymallus, thymallus}), {D}anube salmon (\emph{Hucho hucho}), {A}rctic char (\emph{Salvelinus alpinus}) and brown trout (\emph{Salmo trutta fario}).}, ' ... 
'journal = {Aquaculture}, ' ...
'volume = {38}, '...
'pages = {315--327}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hell1969'; type = 'Article'; bib = [ ...    
'author = {Hellawell, J. M.}, ' ...
'year  = {1969}, ' ...
'title = {Age Determination and Growth of the Grayling \emph{Thymallus thymallus} ({L}.) of the {R}iver {L}ugg, {H}erefordshire}, ' ...  
'journal = {J Fish Biol}, ' ...
'volume = {1}, ' ...
'pages = {373--382}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Clar1992'; type = 'Misc'; bib = [ ...    
'author = {Clark, R. A.}, ' ...
'year  = {1992}, ' ...
'title = {Age and size at maturity of {A}rctic grayling in selected waters of the {T}anana drainage.}, ' ...  
'series = {Fishery manuscript}, ' ...
'volume = {92-5}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'IngrIbbo20aa'; type = 'Techreport'; bib = [ ...    
'author = {Ingram, A. and Ibbotson, A. and Gallagher, M.}, ' ...
'year  = {20aa}, ' ...
'title = {The ecology and managements of the {E}uropean grayling \emph{Thymallus thymallus} ({L}innaeus).}, ' ...  
'institution = {Institute of freshwater ecology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/4605}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

  