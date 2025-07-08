function [data, auxData, metaData, txtData, weights] = mydata_Pseudemys_texana
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Pseudemys_texana'; 
metaData.species_en = 'Texas river cooter';

metaData.ecoCode.climate = {'BSk','Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl','biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 55;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 2.6*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Lind2007';
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '6-10 yr';
data.tpm = 2.6*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Lind2007';
  temp.tpm = C2K(22);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 77*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on P. concinna';

data.Lb = 2.5/0.92; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'Lind2007';
data.Lp = 9; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';      bibkey.Lp = 'Lind2007';
data.Li = 30.5; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'Wiki';
data.Lim = 25; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'guess';

data.Wwi = 4800; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Pseudemys_alabamensis';

data.Ri  = 8.4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Lind2007';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-19 eggs per clutch, 1 clutch per yr assumed';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), plastron length (cm)
0.673	4.464
0.773	4.906
1.455	6.314
1.526	5.791
1.536	5.228
1.646	6.515
1.676	5.831
2.529	7.399
2.570	9.571
2.610	5.429
3.533	10.416
3.614	11.622
4.537	9.893
4.617	13.874
5.701	13.190];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Lind2007';
comment.tL_f = 'Data for females; temp is guessed';
%
data.tL_m = [ ... % time since birth (yr), plastron length (cm)
2.459	10.496
2.529	8.807
2.570	8.968
2.620	9.249
2.680	9.088
2.730	9.491
2.790	7.842
3.644	8.606
3.684	9.531
5.601	9.893
5.671	11.180];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Lind2007';
comment.tL_m = 'Data for males; temp is guessed';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Although mainly herbivorous, animal food is also taken';
metaData.bibkey.F1 = 'Lind2007';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6WCBL'; % Cat of Life
metaData.links.id_ITIS = '208650'; % ITIS
metaData.links.id_EoL = '1055541'; % Ency of Life
metaData.links.id_Wiki = 'Pseudemys_texana'; % Wikipedia
metaData.links.id_ADW = 'Pseudemys_texana'; % ADW
metaData.links.id_Taxo = '549767'; % Taxonomicon
metaData.links.id_WoRMS = '1485152'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Pseudemys&species=texana'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudemys_texana}}';
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
bibkey = 'Lind2007'; type = 'Article'; bib = [ ... 
'author = {Peter V. Lindeman}, ' ... 
'year = {2007}, ' ...
'title = {DIET, GROWTH, BODY SIZE, AND REPRODUCTIVE POTENTIAL OF THE {T}EXAS RIVER COOTER (\emph{Pseudemys texana}) IN THE SOUTH {L}LANO {R}IVER, {T}EXAS}, ' ...
'journal = {THE SOUTHWESTERN NATURALIST} , ' ...
'volume = {52(4)}, ' ...
'pages = {586-594}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1055541}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

