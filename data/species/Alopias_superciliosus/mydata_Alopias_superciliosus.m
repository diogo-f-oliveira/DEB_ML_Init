function [data, auxData, metaData, txtData, weights] = mydata_Alopias_superciliosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Lamniformes'; 
metaData.family     = 'Alopiidae';
metaData.species    = 'Alopias_superciliosus'; 
metaData.species_en = 'Bigeye thresher'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MI','MP'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCic', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm     = [2020 10 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 14];


%% set data
% zero-variate data

data.tp = 12.8 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(17); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 9.5* 365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'ADW';
  temp.tpm = C2K(17); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 20*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 69.6;       units.Lb  = 'cm';  label.Lb  = 'precaudal length at birth'; bibkey.Lb  = 'LiuChian1998';  
data.Lp  = 177.7;    units.Lp  = 'cm';  label.Lp  = 'precaudal length at puberty for females';  bibkey.Lp  = 'LiuChian1998'; 
  comment.Lp = 'based on TL 332-341 cm and F3';
data.Lpm  = 150;   units.Lpm  = 'cm';  label.Lpm  = 'precaudal length at puberty for males';  bibkey.Lpm  = 'LiuChian1998'; 
  comment.Lpm = 'based on TL 270-288 cm anf F3';
data.Li  = 224.6;      units.Li  = 'cm';  label.Li  = 'ultimate precaudal length for females';  bibkey.Li  = 'LiuChian1998';
data.Lim  = 218.8;     units.Lim  = 'cm';  label.Lim  = 'ultimate precaudal length for males';  bibkey.Lim  = 'LiuChian1998';

data.Wwp = 116.5e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = 'LiuChian1998';
  comment.Wwp = 'based on 6.87e-5*Lp^2.769, see F2';
data.Wwpm = 69.1e3;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';    bibkey.Wwpm = 'LiuChian1998';
  comment.Wwim = 'based on 9.93e-5*Lpm^2.685, see F2';
data.Wwi = 222.8e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';                  bibkey.Wwi = 'LiuChian1998';
  comment.Wwi = 'based on 6.87e-5*Li^2.769, see F2; fishbase gives 363.8 kg';
data.Wwim = 190.5e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';      bibkey.Wwim = 'LiuChian1998';
  comment.Wwim = 'based on 9.93e-5*Lim^2.685, see F2';

data.Ri  = 3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-4 pups per litter';
  
 % uni-variate data
 
% t-L data post birth
data.tL_f = [ ... % time since birth (yr), precaudal length (cm)
    0  69.635
    1  84.846
    2  98.532
    3 109.131
    4 119.533
    5 126.312
    6 135.548
    7 142.473
    8 150.499
    9 156.675
   10 162.246
   11 167.166
   12 172.771
   13 178.021
   14 182.651
   15 186.072
   16 190.287
   17 193.847
   18 196.429
   19 198.109
   20 200.057];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'precaudal length'};  
temp.tL_f    = C2K(17);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'LiuChian1998';
comment.tL_f = 'Data for females';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Mean temp 17 C is guessed, usually 0 - 152 m deep';
metaData.bibkey.D2 = 'fishbase'; 
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in kg = 6.87e-5 * (PCL in cm)^2.769  for females, 9.93e-5*(PCL in cm)^2.685 for males';
metaData.bibkey.F2 = 'LiuChian1998'; 
F3 = 'length-length: TL in cm = 15.3+1.81*(PCL in cm) females, 15.1+1.76*(PCL in cm) for males';
metaData.bibkey.F3 = 'LiuChian1998'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '65WK9'; % Cat of Life
metaData.links.id_ITIS = '159921'; % ITIS
metaData.links.id_EoL = '46559743'; % Ency of Life
metaData.links.id_Wiki = 'Alopias_superciliosus'; % Wikipedia
metaData.links.id_ADW = 'Alopias_superciliosus'; % ADW
metaData.links.id_Taxo = '41894'; % Taxonomicon
metaData.links.id_WoRMS = '105835'; % WoRMS
metaData.links.id_fishbase = 'Alopias-superciliosus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alopias_superciliosus}}';
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
bibkey = 'LiuChian1998'; type = 'Article'; bib = [ ... 
'author = {Kwang-Ming Liu and Pro-Jen Chiang and Che-Tsung Chen}, ' ... 
'year = {1999}, ' ...
'title = {Age and Growth estimates of the bigeye Thresher Shark, \emph{Alopias superciliosus} in the {N}orthwestern {T}aiwan waters}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {1998}, ' ...
'pages = {482-491}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Alopias-superciliosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Alopias_superciliosus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

