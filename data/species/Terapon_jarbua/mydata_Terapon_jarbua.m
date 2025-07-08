function [data, auxData, metaData, txtData, weights] = mydata_Terapon_jarbua
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Terapontidae';
metaData.species    = 'Terapon_jarbua'; 
metaData.species_en = 'Jarbua terapon'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MI'};
metaData.ecoCode.habitat = {'0iMm', '0iFr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 15];

%% set data
% zero-variate data

data.am = 9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(23.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 13;   units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'fishbase';
  comment.Lp = 'based on end of 1st yr, early 2nd yr';
data.Li  = 36;   units.Li  = 'cm';  label.Li  = 'ultimate std length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 560 mum: pi/6*0.056^3';
data.Wwp = 36.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01585*Lp^3.02, see F1';
data.Wwi = 794;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01585*Li^3.02, see F1';

data.Ri  = 6e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(23.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Amniataba_caudavittata';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
0.000	0.453
1.959	15.086
1.983	14.180
1.983	11.099
2.968	17.034
2.980	14.180
2.992	13.681
2.992	13.047
3.016	15.040
3.965	16.173
3.965	15.629
3.977	17.305
4.001	16.852
4.001	14.768
4.001	14.089
4.013	15.267
4.975	16.445
4.975	15.946
4.975	15.448
4.999	16.898
5.011	20.023
5.011	17.351
5.972	17.985
5.984	21.383
5.984	19.525
5.984	16.399
5.996	20.023
5.996	19.072
5.996	18.710
6.008	22.017
6.020	18.483
6.981	22.107
6.993	19.752
6.993	20.295
7.005	19.435
7.017	18.211
7.017	18.891
7.017	21.564
7.017	24.101
7.029	21.020
7.967	21.201
7.991	22.243
8.003	26.411
8.003	24.327
8.015	20.703];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time', 'std length'};  
temp.tL    = C2K(23.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FortUy2019';

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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';     
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01585*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '55DL2'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46580098'; % Ency of Life
metaData.links.id_Wiki = 'Terapon_jarbua'; % Wikipedia
metaData.links.id_ADW = 'Terapon_jarbua'; % ADW
metaData.links.id_Taxo = '188882'; % Taxonomicon
metaData.links.id_WoRMS = '218350'; % WoRMS
metaData.links.id_fishbase = 'Terapon-jarbua'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Terapon_jarbua}}';
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
bibkey = 'FortUy2019'; type = 'Article'; bib = [ ... 
'author = {Maybelle A. Fortaleza and Reena Cyndi L. Uy and Merlene E. Elumba and Cleto L. Na\~{n}ola}, ' ... 
'year = {2019}, ' ...
'title = {Age-Growth Parameters of Crescent Grunter, \emph{Terapon jarbua} ({F}orsskal 1775) in {M}indanao, {P}hilippines}, ' ...
'journal = {Phil. J. of Nat. Sci.}, ' ...
'volume = {24}, ' ...
'pages = {42-49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {https://www.fishbase.de/summary/Terapon-jarbua.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

