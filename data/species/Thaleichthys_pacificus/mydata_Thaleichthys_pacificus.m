  function [data, auxData, metaData, txtData, weights] = mydata_Thaleichthys_pacificus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osmeriformes'; 
metaData.family     = 'Osmeridae';
metaData.species    = 'Thaleichthys_pacificus'; 
metaData.species_en = 'Eulachon';

metaData.ecoCode.climate = {'MC','Dfb'};
metaData.ecoCode.ecozone = {'MPNE','THn'};
metaData.ecoCode.habitat = {'0jFe', '0jFl', 'jiMcp'};
metaData.ecoCode.embryo  = {'Fs', 'Fg', 'Fh'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

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
data.am = 5*365;  units.am = 'd';   label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15.5;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 34;   units.Li = 'cm';  label.Li = 'ultimate total length';    bibkey.Li = 'fishbase';

data.Wwb = 4.49e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'ChigSibl1994';
  comment.Wwb = 'based on egg diameter of 0.95 mm for Spirinchus_thaleichthys: pi/6*0.095^3';
data.Wwp = 22.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00389*Lp^3.16, see F1';
data.Wwi = 269;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.16, see F1';

data.Ri = 6e4/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data

% time - length
data.tL = [ ... % Ba peaks (#), fork length (cm)
1.488	13.765
1.488	9.785
1.495	12.006
1.495	11.659
1.495	11.034
1.944	17.123
1.950	19.877
1.950	17.030
1.957	17.678
1.957	17.192
1.957	16.845
1.957	15.989
1.964	16.475
1.970	17.586
1.977	20.687
1.977	19.229
1.977	18.951
1.977	17.378
2.492	14.581
2.492	19.810
2.498	17.936
2.505	16.848
2.518	15.206
2.875	18.216
2.901	16.990
2.921	19.952
2.954	18.054
2.960	20.831
2.960	20.206
2.960	17.730
2.967	19.882
2.967	18.841
2.967	18.702
2.967	18.216
2.974	19.142
2.974	16.944
2.980	20.531
2.980	19.651
3.020	19.212
3.020	18.518
3.026	20.323
3.026	20.114
3.026	17.777
3.033	21.202
3.040	20.716
3.040	20.461
3.040	19.790
3.073	18.541
3.073	18.356
3.073	18.078
3.073	17.384
3.079	19.397
3.079	19.235
3.079	18.772
3.079	17.523
3.086	17.129
3.099	19.050
3.099	19.166
3.112	20.508
3.145	18.842
3.957	20.166
3.964	18.430
4.023	18.732
4.030	19.819
4.030	20.097
4.030	20.259
4.030	20.467
4.036	19.264];
data.tL(:,1) = data.tL(:,1) * 365; % convert Ba peaks to d
data.tL(:,2) = data.tL(:,2)/ 0.94; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(9); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'ClarLewi2007'};
comment.tL = 'Ba peaks were converted to age since birth, assuming 1 peak per yr';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: FL = 0.94 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);
                                 
%% Links
metaData.links.id_CoL = '7C5HL'; % Cat of Life
metaData.links.id_ITIS = '162051'; % ITIS
metaData.links.id_EoL = '46563022'; % Ency of Life
metaData.links.id_Wiki = 'Thaleichthys_pacificus'; % Wikipedia
metaData.links.id_ADW = 'Thaleichthys_pacificus'; % ADW
metaData.links.id_Taxo = '188961'; % Taxonomicon
metaData.links.id_WoRMS = '282959'; % WoRMS
metaData.links.id_fishbase = 'Thaleichthys-pacificus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Thaleichthys_pacificus}}';  
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
bibkey = 'ClarLewi2007'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.2007.01618.x}, ' ...
'author = {A. D. Clarke and A. Lewis and K. H. Telmer and J. M. Shripton}, ' ...
'year = {2007}, ' ...
'title = {Life history and age at maturity of an anadromous smelt, the eulachon \emph{Thaleichthys pacificus} ({R}ichardson)}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volumes = {71}, ' ...
'pages = {1479-1493}'];
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
'howpublished = {\url{http://www.fishbase.org/summary/Thaleichthys-pacificus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
