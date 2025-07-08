function [data, auxData, metaData, txtData, weights] = mydata_Graptemys_versa
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Graptemys_versa'; 
metaData.species_en = 'Texas map turtle';

metaData.ecoCode.climate = {'BSk','Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl','biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 05];

%% set data
% zero-variate data

data.ab = 75;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'ADW';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '65-85 d';
data.tp = 1.6*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Lind2005';
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 35*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Graptemys_pseudogeographica';

data.Lb = 2/0.92; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'Lind2005';
data.Lp = 11.5; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';      bibkey.Lp = 'Lind2005';
data.Li = 16.5; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'Lind2005';
data.Lim = 9; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'Wiki';

data.Wwi = 1405; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'EoL';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), plastron length (cm)
0.517	3.655
0.589	4.497
0.641	4.246
0.713	3.966
0.744	5.201
1.540	4.455
1.612	4.792
1.623	5.943
1.685	4.681
2.481	6.853
2.543	6.096
2.615	6.574
2.646	8.370
2.677	6.855
2.739	6.996
2.811	6.857
3.649	7.262
3.700	9.451
4.579	11.118
4.620	9.183
4.661	13.336
5.592	11.077
6.636	12.494];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Lind2005';
comment.tL_f = 'Data for females from South Llano River in Kimble County, Texas; temp is guessed';

% length - fecundity
data.LN = [ ... % plastron length (cm), clutch size
11.512	3.897
11.626	5.021
12.960	3.936
13.095	4.947
13.114	3.984
13.218	4.994
13.309	3.872
13.600	6.053
13.918	6.033
14.474	7.071
14.688	6.019
14.893	5.953
15.480	7.037
16.284	9.040];
data.LN(:,1) = data.LN(:,1) / 0.93; % convert plastron to carapace length (guessed)
units.LN   = {'cm', '#'};  label.LN = {'carapace length', 'clutch size'};  
temp.LN    = C2K(22);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Lind2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Temperatures < 28 C give males, >30 C females';
metaData.bibkey.F1 = 'ADW';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6KSV8'; % Cat of Life
metaData.links.id_ITIS = '173802'; % ITIS
metaData.links.id_EoL = '793418'; % Ency of Life
metaData.links.id_Wiki = 'Graptemys_versa'; % Wikipedia
metaData.links.id_ADW = 'Graptemys_versa'; % ADW
metaData.links.id_Taxo = '399218'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Graptemys&species=versa'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Graptemys_versa}}';
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
bibkey = 'Lind2005'; type = 'Article'; bib = [ ... 
'author = {Peter V. Lindeman}, ' ... 
'year = {2005}, ' ...
'title = {Aspects of the Life History of the Texas Map Turtle (\emph{Graptemys versa})}, ' ...
'journal = {Am. Midl. Nat.} , ' ...
'volume = {153}, ' ...
'pages = {378-388}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/793418}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Graptemys_versa/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

