function [data, auxData, metaData, txtData, weights] = mydata_Dicologlossa_cuneata 

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Soleidae';
metaData.species    = 'Dicologlossa_cuneata'; 
metaData.species_en = 'Wedge sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.2); % K
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-W'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Samira Boufersaoui'};            
metaData.date_subm   = [2018 06 13];                      
metaData.email       = {'samira.boufersaoui@gmail.com'}; 
metaData.address     = {'ENSSMAL, 16000, Algeria'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 06 27]; 

%% set data
% zero-variate data;

data.ab = 2;      units.ab = 'd';      label.ab = 'age at birth';            bibkey.ab = 'MariIsma2007';    
  temp.ab = C2K(18.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';    
data.tp = 933;      units.tp = 'd';      label.tp = 'time since birth at puberty';  bibkey.tp = 'BoufZero2018';
  temp.tp = C2K(18.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';   
data.am = 2190;       units.am = 'd';    label.am = 'life span';                   bibkey.am = 'BoufSaid2015';   
  temp.am = C2K(18.2);  units.temp.am = 'K'; label.temp.am = 'temperature';    

data.Lb  = 0.239;   units.Lb  = 'cm';   label.Lb  = ' total length at birth';   bibkey.Lb  = 'MariIsma2007';
data.Lp  = 16;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Ouab1991';
data.Li  = 24.23;   units.Li  = 'cm';   label.Li  = 'ultimate total lenght';    bibkey.Li  = 'BoufSaid2015';

data.Wwb = 0.000138; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BoufSaid2015';
data.Wwp = 29.531;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'BoufSaid2015';
data.Wwi = 99.210;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BoufSaid2015';

data.Ri  = 116.35; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'BoufSaid2015';   
temp.Ri = C2K(18.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';                    
  
% uni-variate data

data.tL = [365 365 730 730 730 730 730 730 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 1825 2190 2190 2190 2190 365 365 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 730 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 1460 2190 2190 2190 ; % d, time since birth
            14.3 14.7 15.9 14.9 15.1 15.9 16.1 14.8 17.1 17.6 16.7 17.7 16.5 16.4 17.2 16 15.9 15.9 15.6 15.7 16.9 16.3 16.3 16.1 16.8 17.2 16.6 18.1 17.9 15.9 17.4 18.2 18 18 17.4 17.3 18.9 18.1 18.7 17.1 17.2 17.4 17.3 17.6 17.4 17.4 18.3 16.9 17.8 19 18.5 17.7 18.4 17.5 18.4 18.3 18.3 17.4 18.1 18 17.1 18.2 18.2 19 16.8 20.5 19.1 19.1 19.9 19 19.3 19.6 19.6 19.9 18.7 19.2 18.4 19.5 18.9 19.4 20.9 20.4 20.1 21.3 12.9 12.6 15.4 14.3 14.9 14.1 14.3 15 14.4 15 13.6 15.1 14.4 16.2 14.4 15.2 14.3 14.6 15.5 13.8 13.7 14.1 15.2 13.6 13.5 14.8 14.3 14.8 14.5 13.7 15 14.3 15.7 16.7 16.5 17.2 15.2 16.4 16.1 15.6 16.9 16.2 16.3 15.7 15.5 16.2 16 15.8 15.8 15 16.1 16.9 16.5 15.9 15.7 15.7 15.2 15.4 15.6 15.7 17.8 15.2 17.4 17.8 16.8 16.5 18.8 19 19.1 18 17.7 19.9 18.9 18.2 17.8 17.5 15.9 18.4 17.4 17.2 18.7 17.2 17.9 18.4 17.9 17.9 21.4 20.4 20]';   % cm, total length at f and T
data.tL(:,1) = data.tL(:,1) - 365/3; % convert to time since birth
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  bibkey.tL = 'BoufSaid2015';
  temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
  
data.LW = [15.7 17 15.9 15.5 15.4 14.3 17.1 17.6 12.9 16.7 14.9 14.1 16.5 14.3 17.2 15 16.7 18.1 15.2 14.7 14.3 15.1 16.4 18.1 15.9 17.4 14.4 15 18.8 16.1 16.4 19 16.8 17.9 18.2 18 20.5 18 19 19.1 18 17.7 20.9 19.9 16.1 20.4 18.7 21.4 18.9 18.2 20.1 19 17.7 17.4 15.6 20.4 20 19.1 19.1 16.9 17.8 16.5 16.6 19.3 14.9 16.2 19.6 16.3 17.5 19 13.6 15.7 15.9 15.5 16 15.9 16.2 15.9 18.5 21.3 18.4 17.1 16 16.9 17.7 19.9 18.4 15.1 17.5 15.8 18.4 14.4 18.3 16.2 15.8 17.4 17.2 16.3 15 18.7 14.4 17.4 17.3 17.6 19.2 15.2 14.3 16.1 18.4 14.6 12.6 18.3 17.4 16.3 15.5 16.9 18.1 17.3 17.4 13.8 13.7 17.2 17.4 15.9 15.6 16.5 16.1 18 15.9 14.1 15.2 15.7 13.6 18.7 18.3 16.8 15.7 15.2 17.2 15.4 13.5 14.8 14.4 16.9 15.6 14.8 19.5 17.2 14.3 15.7 14.8 14.5 13.7 17.8 15.7 17.8 15 17.2 15.2 14.3 17.4 17.9 18.4 17.1 18.9 18.2 17.8 17.9 16.8 18.9 16.5 19.6 19.4 18.2 19.9 17.3 17.9 16.2 15.1 15.55 15.8 18.8 14.9 16.2 17.7 18.9 17 16.8 19.3 17.5 17.3 15.2 16.7 15.9 15.05 16.2 14.7 14.4 15.7 20.8 16.7 17.6 17.3 15.9 16.9 17.1 18.3 18.9 16.8 17.5 22.2 17.5 19.2 16.6 ;      % cm, total length at f
         34.72 44.1 39.51 25.06 32.78 22.89 41.82 50.3 17 47.41 23.74 23.15 35.81 29.34 40.35 31.29 36.15 40.31 30.29 31.6 21.28 24.72 28.17 47.32 30.91 37.6 22.3 24.61 45.75 34.1 35.41 58.68 39.68 46.02 50.35 46.94 62.22 51.47 53.22 51.95 46.61 45.38 68.98 49.66 42.13 68.76 53.37 67.82 50.03 44.53 68 50.03 43.07 46.81 40.5 65.76 62.27 61.19 59.56 37.26 42.97 43.45 43.36 60.61 25.81 46.81 57.74 28.98 38.06 47.96 19.4 25.7 24.64 29.22 30.04 29.74 30.12 30.28 47.79 70.19 47.21 36.13 32.24 36.31 41.06 60.19 43.93 24.69 42.33 29 53.63 20.18 45.01 27.08 25.68 40.37 40.96 31.29 26.3 50.44 20.04 45.23 33.31 34.38 54.29 22.55 22.11 31.08 48.27 22.31 17.67 49.71 34.95 34.19 28.87 30.61 44.39 35.08 44.05 19.25 16.97 33.21 34.74 25.26 31.12 33.47 26.72 41.23 28.26 20.93 23.66 26.61 19.5 44.14 44.43 31.84 25.02 23.14 35.55 27.09 18.5 33.98 14.11 37.34 27.1 22.58 61.01 38.63 19.76 25.85 23.18 21.98 18.08 38.35 30.59 43.34 23.65 36.19 26.98 21.28 36.11 36.52 42.36 34.85 50.34 43.33 39.13 36.38 31.94 53.54 31.78 50.92 52.77 43.56 51.88 34.6 37.1 29.66 22.07 30.24 31.14 48.73 23.97 29.3 42.56 46.57 40.09 28.67 47.08 38.16 42.82 27.05 31.08 32.64 33.14 31.41 23.37 24.31 29.37 64.58 33.71 46.8 42.83 28.37 36.39 35.71 46.64 49.45 32.27 37.16 60.06 35.4 49.97 25.73]';   % g, wet weight at f and T
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  bibkey.LW = 'BoufSaid2015';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Links
metaData.links.id_CoL = '35QFH'; % Cat of Life
metaData.links.id_ITIS = '173031'; % ITIS
metaData.links.id_EoL = '46570261'; % Ency of Life
metaData.links.id_Wiki = 'Dicologlossa_cuneata'; % Wikipedia
metaData.links.id_ADW = 'Dicologlossa_cuneata'; % ADW
metaData.links.id_Taxo = '173137'; % Taxonomicon
metaData.links.id_WoRMS = '127154'; % WoRMS
metaData.links.id_fishbase = 'Dicologlossa-cuneata'; % fishbase


%% References 
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dicologlossa_cuneata}}';
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
bibkey = 'Ouab1991'; type = 'Phdthesis'; bib = [ ...  
'author = {Ouabadi, T.}, ' ...
'year = {2015}, ' ...
'title  = {}, ' ...
'school = {ENSSMAL Univ., Algiers}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoufSaid2015'; type = 'Techreport'; bib = [ ...  
'author = {Boufersaoui, S. and Saidani, M.}, ' ...
'year = {2015}, ' ...
'title  = {}, ' ...
'institution = {ENSSMAL Univ., Algiers}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoufZero2018'; type = 'Techreport'; bib = [ ...  
'author = {Boufersaoui, S. and Zeroual, H.}, ' ...
'year = {2018}, ' ...
'title  = {Estimation des param\`{e}tres  du mod\`{e}le bio\''{e}nerg\''{e}tique {DEB} pour \''{e}tudier la croissance et la reproduction de quelques esp\`{e}ces des c\^{o}tes alg\''{e}riennes}, ' ...
'institution = {ENSSMAL Univ., Algiers}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MariIsma2007'; type = 'Article'; bib = [ ... 
'author = {Marinaro, H. and Ismael, H. and Montserrat, R. and Jos\''{e}, F.F. and Jos\''{e}, M.M. and Jos\''{e}, I.N}, ' ...
'year = {2007}, ' ...
'title = {First results on spawning, larval rearing and growth of the wedge sole (\emph{Dicologoglossa cuneata}) in captivity, a candidate species for aquaculture}, ' ...
'journal = {Aquacult Int}, ' ...
'volume = {16}, ' ...
'pages = {69--84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.se/summary/Pagellus-acarne.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

